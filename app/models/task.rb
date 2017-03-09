class Task < ApplicationRecord
  belongs_to :visualisation
  has_many :experiment_tasks
  has_many :experiment_task_results, :through => :experiment_tasks
end
