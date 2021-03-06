class ExperimentsController < ApplicationController
  before_action :set_experiment, only: [:show, :edit, :update, :destroy]
  http_basic_authenticate_with name: ENV["APP_USER"], password: ENV["APP_SECRET"], except: [:public_show, :create_and_start_instance, :run_experiment, :submit_task_result, :submit_result, :public_experiment_task_result]

  # GET /experiments
  # GET /experiments.json
  def index
    @experiments = Experiment.all
  end

  # GET /experiments/1
  # GET /experiments/1.json
  def show
    @experiment_tasks = @experiment.experiment_tasks.order(:order)
    @experiment_results = @experiment.experiment_results
    # @experiment_result = ExperimentResult.get_next_id
  end

  def open
    @experiment = Experiment.find(params[:experiment_id])
    @experiment.update(active: true)  

    redirect_to @experiment, notice: 'This experiment now live.'
  end

  def close
    @experiment = Experiment.find(params[:experiment_id])
    @experiment.update(active: false) 
    
    redirect_to @experiment, notice: 'This experiment is now closed.'    
  end

  def public_show
    @experiment = Experiment.find_by_uuid(params[:experiment_uuid])
    if @experiment.intro_html
      @experiment.intro_html = @experiment.intro_html.html_safe
    end
    render :layout => 'public_view'
  end

  # creates an instance of the experiment
  def create_instance
    @experiment = Experiment.find(params[:experiment_id])

    experiment_length = @experiment.experiment_tasks.length
    ordering = *(2..experiment_length)
    ordering = ordering.shuffle
    ordering.unshift(1)

    @experiment_result = ExperimentResult.create(experiment_id: @experiment.id,
    uuid: ExperimentResult.generate_uuid, completed: false,
    input_type: "None", device_type: "None", ordering: ordering)

    redirect_to @experiment
  end

  def create_and_start_instance
    input_type = params[:request][:input_type]
    device_type = params[:request][:device_type]

    @experiment = Experiment.find(params[:experiment_id])

    experiment_length = @experiment.experiment_tasks.length
    ordering = *(2..experiment_length)
    ordering = ordering.shuffle
    ordering.unshift(1)

    @experiment_result = ExperimentResult.create(experiment_id: @experiment.id,
    uuid: ExperimentResult.generate_uuid, completed: false,
    input_type: input_type, device_type: device_type, ordering: ordering)

    if (@experiment_result.valid?)
      redirect_to run_experiment_url(@experiment_result.uuid)
    else
      redirect_to public_show_path(@experiment.uuid), notice: 'Please select a device type and input type to proceed!'
    end

  end

  # run an experiment
  def run_experiment
    @experiment_result = ExperimentResult.find_by_uuid(params[:uuid])
    @experiment = @experiment_result.experiment
    @experiment_tasks = @experiment.experiment_tasks.order(:order)

    if (params[:position].to_i > @experiment_tasks.length)
      redirect_to submit_experiment_result_path(:uuid => @experiment_result.uuid)
    else
      if params[:position]
        @position = params[:position].to_i
      else
        @position = 1
      end

      converted_position = @experiment_result.ordering[@position - 1].to_i
      @experiment_task = @experiment_tasks[converted_position - 1]
      @task = @experiment_task.task
      @visualisation = @task.visualisation
      if (@visualisation.html.start_with?('http'))
        @visualisation.html = open(@visualisation.html).read
      end

      render :layout => 'public_view'
    end
  end

  # submits each task result
  def submit_task_result
    @position = params[:position]
    if params[:request][:result].start_with?('{')
      @result = JSON.parse(params[:request][:result])
    else
      @result = JSON.parse('{"answer":"' + params[:request][:result] + '"}')
    end
    @experiment_result = ExperimentResult.find_by_uuid(params[:uuid])
    @experiment = @experiment_result.experiment
    converted_position = @experiment_result.ordering[@position.to_i - 1].to_i
    @experiment_task = ExperimentTask.find_by(order: converted_position, experiment_id: @experiment.id)

    @experiment_task_result = ExperimentTaskResult.find_or_create_by(experiment_task_id: @experiment_task.id, experiment_result_id: @experiment_result.id)
    @experiment_task_result.update(result: @result)

    redirect_to run_experiment_pos_path(:uuid => @experiment_result.uuid, :position => (@position.to_i + 1))
  end

  # completes experiment
  def submit_result
    @experiment_result = ExperimentResult.find_by_uuid(params[:uuid])
    @experiment_result.update(completed: true)
    @experiment_task_results = @experiment_result.experiment_task_results.includes(:experiment_task).order("experiment_tasks.order asc")

    render :layout => 'public_view'
  end

  def view_results
    @experiment_result = ExperimentResult.find_by_uuid(params[:uuid])
    @experiment = @experiment_result.experiment
    @experiment_task_results = @experiment_result.experiment_task_results.includes(:experiment_task).order("experiment_tasks.order asc")
  end

  # a private view (admin) of an experiment_task result
  def experiment_task_result
    @experiment_task_result = ExperimentTaskResult.find(params[:experiment_task_result_id])
    @visualisation = @experiment_task_result.experiment_task.task.visualisation
    if (@visualisation.html.start_with?('http'))
      @visualisation.html = open(@visualisation.html).read
    end
  end

  # a public view of an experiment task result
  def public_experiment_task_result
    @experiment_result = ExperimentResult.find_by_uuid(params[:uuid])
    @experiment_task_results = @experiment_result.experiment_task_results
    @experiment_task_result = ExperimentTaskResult.find_by(experiment_result_id: @experiment_result.id, experiment_task_id: params[:experiment_task_id])
    @experiment_task = @experiment_task_result.experiment_task

    @visualisation = @experiment_task_result.experiment_task.task.visualisation
    if (@visualisation.html.start_with?('http'))
      @visualisation.html = open(@visualisation.html).read
    end

    render :layout => 'public_view'
  end

  # for previewing experiments
  def preview
    @experiment = Experiment.find(params[:experiment_id])
    @experiment_tasks = @experiment.experiment_tasks.order(:order)
    @position = params[:position]
    @task = @experiment_tasks[@position.to_i - 1].task
    @visualisation = @task.visualisation
    if (@visualisation.html.start_with?('http'))
      @visualisation.html = open(@visualisation.html).read
    end
  end

  #
  #
  #

  # GET /experiments/new
  def new
    @experiment = Experiment.new
  end

  # GET /experiments/1/edit
  def edit
  end

  # POST /experiments
  # POST /experiments.json
  def create
    @experiment = Experiment.new(experiment_params)
    @experiment.update(uuid: ExperimentResult.generate_uuid, active: false)

    respond_to do |format|
      if @experiment.save
        format.html { redirect_to @experiment, notice: 'Experiment was successfully created.' }
        format.json { render :show, status: :created, location: @experiment }
      else
        format.html { render :new }
        format.json { render json: @experiment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /experiments/1
  # PATCH/PUT /experiments/1.json
  def update
    respond_to do |format|
      if @experiment.update(experiment_params)
        format.html { redirect_to @experiment, notice: 'Experiment was successfully updated.' }
        format.json { render :show, status: :ok, location: @experiment }
      else
        format.html { render :edit }
        format.json { render json: @experiment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /experiments/1
  # DELETE /experiments/1.json
  def destroy
    @experiment.destroy
    respond_to do |format|
      format.html { redirect_to experiments_url, notice: 'Experiment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_experiment
      @experiment = Experiment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def experiment_params
      params.require(:experiment).permit(:name, :intro_html)
    end
end
