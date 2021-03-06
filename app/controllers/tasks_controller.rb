require 'json'

class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  http_basic_authenticate_with name: ENV["APP_USER"], password: ENV["APP_SECRET"]

  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = Task.paginate(:page => params[:page], :per_page => 10)
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
    @visualisation = Visualisation.find(@task.visualisation_id)
    if (@visualisation.html.start_with?('http'))
      @visualisation.html = open(@visualisation.html).read
    end
  end

  # GET /tasks/1/preview
  def preview
    @task = Task.find(params[:task_id])
    @visualisation = Visualisation.find(@task.visualisation_id)
    if (@visualisation.html.start_with?('http'))
      @visualisation.html = open(@visualisation.html).read
    end
  end

  # GET /tasks/new
  def new
    @task = Task.new
    if params[:visualisation_id]
      @visualisation_id = params[:visualisation_id]
    end
  end

  # GET /tasks/1/edit
  def edit
  end

  def add_annotations
    @task = Task.find(params[:task_id])
    @annotations = params[:request][:annotations]
    @task.update(annotations: @annotations)
    redirect_back(fallback_location: @task)
  end

  def add_coordinates
    @task = Task.find(params[:task_id])
    @coordinates = JSON.parse(params[:request][:result])
    updated_coordinates = @task.correct_coordinates.push(@coordinates[0])
    @task.update(correct_coordinates: updated_coordinates)
    redirect_back(fallback_location: @task)
  end

  def remove_coordinates
    @task = Task.find(params[:task_id])
    new_coordinates = @task.correct_coordinates
    new_coordinates.delete_at(params[:position].to_i)
    @task.update(correct_coordinates: new_coordinates)
    redirect_back(fallback_location: @task)
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(task_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: 'Task was successfully created.' }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @task, notice: 'Task was successfully updated.' }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: 'Task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:name, :visualisation_id, :task_type, :description, :no_of_clicks)
    end
end
