class AddExperimentResultToExperimentTaskResults < ActiveRecord::Migration[5.0]
  def change
    add_reference :experiment_task_results, :experiment_result, foreign_key: true
  end
end
