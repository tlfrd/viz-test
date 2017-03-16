class ExperimentsController < ApplicationController
  before_action :set_experiment, only: [:show, :edit, :update, :destroy]

  # GET /experiments
  # GET /experiments.json
  def index
    @experiments = Experiment.all
  end

  # GET /experiments/1
  # GET /experiments/1.json
  def show
    @experiment_tasks = @experiment.experiment_tasks.order(:order)
    @experiment_result = ExperimentResult.get_next_id
  end

  def preview
    @experiment = Experiment.find(params[:experiment_id])
    @experiment_tasks = @experiment.experiment_tasks.order(:order)
    @position = params[:position]
    @task = @experiment_tasks[@position.to_i - 1].task
    @visualisation = @task.visualisation
  end

  def run
    @experiment = Experiment.find(params[:experiment_id])
    @experiment_tasks = @experiment.experiment_tasks.order(:order)
    @position = params[:position].to_i
    if ExperimentResult.exists?(id: params[:experiment_result_id].to_i)
      @experiment_result = ExperimentResult.find(params[:experiment_result_id])
    else
      @experiment_result = ExperimentResult.create(id: params[:experiment_result_id])
    end
    @experiment_task = @experiment_tasks[@position - 1]
    @task = @experiment_task.task
    @visualisation = @task.visualisation

    # make sure it doesnt create duplicates if you go back to the page
    if @position > 1
      @previous_experiment_task = ExperimentTask.find_by_order(@position - 1)
      @experiment_task_result = ExperimentTaskResult.create(experiment_task_id: @previous_experiment_task.id, experiment_result_id: @experiment_result.id)
    end
  end

  def submit_result
    @position = params[:position].to_i
    @experiment_result = ExperimentResult.find(params[:experiment_result_id])

    @previous_experiment_task = ExperimentTask.find_by_order(@position - 1)
    @experiment_task_result = ExperimentTaskResult.create(experiment_task_id: @previous_experiment_task.id, experiment_result_id: @experiment_result.id)
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
      params.require(:experiment).permit(:name)
    end
end
