class ExperimentTasksController < ApplicationController
  before_action :set_experiment_task, only: [:show, :edit, :update, :destroy]

  # GET /experiment_tasks
  # GET /experiment_tasks.json
  def index
    @experiment_tasks = ExperimentTask.all
  end

  # GET /experiment_tasks/1
  # GET /experiment_tasks/1.json
  def show
    @visualisation = @experiment_task.task.visualisation
    if (@visualisation.html.start_with?('http'))
      @visualisation.html = open(@visualisation.html).read
    end
  end

  # GET /experiment_tasks/new
  def new
    @experiment_task = ExperimentTask.new
    if params[:experiment_id]
      @experiment_id = params[:experiment_id]
    end
  end

  # GET /experiment_tasks/1/edit
  def edit
  end

  # POST /experiment_tasks
  # POST /experiment_tasks.json
  def create
    # @experiment_task = ExperimentTask.new(experiment_task_params)
    #
    # respond_to do |format|
    #   if @experiment_task.save
    #     format.html { redirect_to @experiment, notice: 'Experiment task was successfully created.' }
    #     format.json { render :show, status: :created, location: @experiment_task }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @experiment_task.errors, status: :unprocessable_entity }
    #   end
    # end

    @experiment_task = ExperimentTask.new(experiment_task_params)

    if @experiment_task.save
      @experiment = params[:experiment_task][:experiment_id]
      redirect_to experiment_path(:id => @experiment)
    end
  end

  # PATCH/PUT /experiment_tasks/1
  # PATCH/PUT /experiment_tasks/1.json
  def update
    @experiment = @experiment_task.experiment
    respond_to do |format|
      if @experiment_task.update(experiment_task_params)
        format.html { redirect_to @experiment, notice: 'Experiment task was successfully updated.' }
        format.json { render :show, status: :ok, location: @experiment_task }
      else
        format.html { render :edit }
        format.json { render json: @experiment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /experiment_tasks/1
  # DELETE /experiment_tasks/1.json
  def destroy
    @experiment = @experiment_task.experiment
    @experiment_task.destroy
    respond_to do |format|
      format.html { redirect_to @experiment, notice: 'Experiment task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_experiment_task
      @experiment_task = ExperimentTask.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def experiment_task_params
      params.require(:experiment_task).permit(:experiment_id, :task_id, :order)
    end
end
