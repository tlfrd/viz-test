class ResultsController < ApplicationController
  http_basic_authenticate_with name: ENV["APP_USER"], password: ENV["APP_SECRET"]
  def index
    @experiment_results = ExperimentResult.all.order(id: :desc)
    @experiment_task = ExperimentTask.all.order(id: :asc)
  end
end
