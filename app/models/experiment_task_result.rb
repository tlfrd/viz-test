class ExperimentTaskResult < ApplicationRecord
  belongs_to :experiment_result
  belongs_to :experiment_task
end
