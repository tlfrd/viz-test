class ResultsController < ApplicationController
  http_basic_authenticate_with name: ENV["APP_USER"], password: ENV["APP_SECRET"]

  def experiment_task_results_for_experiment
    @experiment_tasks = ExperimentTask.where(experiment_id: params[:experiment_id])
    @experiment = Experiment.find_by_id(params[:experiment_id])
  end

  def experiment_task_result
    @experiment_task = ExperimentTask.find(params[:id])
    @task = @experiment_task.task
    @visualisation = @experiment_task.task.visualisation
    if (@visualisation.html.start_with?('http'))
      @visualisation.html = open(@visualisation.html).read
    end
    @experiment_task_results = @experiment_task.experiment_task_results
    if (@experiment_task.task.task_type == "Click")
      # @average_time = ExperimentTaskResult.get_average_time_all(@experiment_task_results)
      # @average_coordinates = ExperimentTaskResult.get_average_coordinates(@experiment_task_results)
    end
  end
end
