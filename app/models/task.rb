class Task < ApplicationRecord
  has_one :visualisation
  has_many :experiment_tasks
  has_many :experiment_task_results, :through => :experiment_tasks
end
