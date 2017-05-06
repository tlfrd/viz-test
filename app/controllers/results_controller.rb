class ResultsController < ApplicationController
  http_basic_authenticate_with name: ENV["APP_USER"], password: ENV["APP_SECRET"]
  def index
    @experiment_results = ExperimentResult.all.order(id: :desc)
    @experiment_tasks = ExperimentTask.all.order(id: :asc)
  end

  def experiment_task_result
    @experiment_task = ExperimentTask.find(params[:id])
    @visualisation = @experiment_task.task.visualisation
    if (@visualisation.html.start_with?('http'))
      @visualisation.html = open(@visualisation.html).read
    end
    @experiment_task_results = @experiment_task.experiment_task_results
    if (@experiment_task.task.task_type == "Click")
      @average_time = ExperimentTaskResult.get_average_time(@experiment_task_results)
      @average_coordinates = ExperimentTaskResult.get_average_coordinates(@experiment_task_results)
    end
  end
end
