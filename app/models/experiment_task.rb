class ExperimentTask < ApplicationRecord
  belongs_to :experiment
  belongs_to :task
  has_many :experiment_task_results, dependent: :destroy
end
