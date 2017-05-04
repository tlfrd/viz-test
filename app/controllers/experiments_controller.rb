class ExperimentsController < ApplicationController
  before_action :set_experiment, only: [:show, :edit, :update, :destroy]
  http_basic_authenticate_with name: ENV["APP_USER"], password: ENV["APP_SECRET"], except: [:public_show, :create_and_start_instance, :run_experiment, :submit_task_result, :submit_result]

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
    @experiment_result = ExperimentResult.create(experiment_id: @experiment.id, uuid: ExperimentResult.generate_uuid, completed: false)
    redirect_to @experiment
  end

  def create_and_start_instance
    @experiment = Experiment.find(params[:experiment_id])
    @experiment_result = ExperimentResult.create(experiment_id: @experiment.id, uuid: ExperimentResult.generate_uuid, completed: false)

    redirect_to run_experiment_url(@experiment_result.uuid)
  end

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

      @experiment_task = @experiment_tasks[@position - 1]
      @task = @experiment_task.task
      @visualisation = @task.visualisation
      if (@visualisation.html.start_with?('http'))
        @visualisation.html = open(@visualisation.html).read
      end

      render :layout => 'public_view'
    end
  end

  def submit_task_result
    @position = params[:position]
    if params[:request][:result].start_with?('{')
      @result = JSON.parse(params[:request][:result])
    else
      @result = JSON.parse('{"answer":"' + params[:request][:result] + '"}')
    end
    @experiment_result = ExperimentResult.find_by_uuid(params[:uuid])
    @experiment = @experiment_result.experiment
    @experiment_task = ExperimentTask.find_by(order: @position, experiment_id: @experiment.id)

    @experiment_task_result = ExperimentTaskResult.find_or_create_by(experiment_task_id: @experiment_task.id, experiment_result_id: @experiment_result.id)
    @experiment_task_result.update(result: @result)

    redirect_to run_experiment_pos_path(:uuid => @experiment_result.uuid, :position => (@position.to_i + 1))
  end

  def submit_result
    @experiment_result = ExperimentResult.find_by_uuid(params[:uuid])
    @experiment_result.update(completed: true)

    render :layout => 'public_view'
  end

  def view_results
    @experiment_result = ExperimentResult.find_by_uuid(params[:uuid])
    @experiment = @experiment_result.experiment
    @experiment_task_results = @experiment_result.experiment_task_results.includes(:experiment_task).order("experiment_tasks.order asc")
  end

  def experiment_task_result
    @experiment_task_result = ExperimentTaskResult.find(params[:experiment_task_result_id])
    @visualisation = @experiment_task_result.experiment_task.task.visualisation
    if (@visualisation.html.start_with?('http'))
      @visualisation.html = open(@visualisation.html).read
    end
  end

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
    @experiment.update(uuid: ExperimentResult.generate_uuid)

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
