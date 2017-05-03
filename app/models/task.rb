class Task < ApplicationRecord
  belongs_to :visualisation
  has_many :experiment_tasks, dependent: :destroy
  has_many :experiment_task_results, :through => :experiment_tasks, dependent: :destroy
end
