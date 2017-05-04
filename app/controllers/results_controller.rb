class ResultsController < ApplicationController
  http_basic_authenticate_with name: ENV["APP_USER"], password: ENV["APP_SECRET"]
  def index
    @experiment_results = ExperimentResult.all.order(id: :desc)
    @experiment_task = ExperimentTask.all.order(id: :asc)
  end

  def experiment_task_result
    @experiment_task = ExperimentTask.find(params[:id])
    @visualisation = @experiment_task.task.visualisation
    if (@visualisation.html.start_with?('http'))
      @visualisation.html = open(@visualisation.html).read
    end
  end
end
