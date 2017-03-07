class Task < ApplicationRecord
  has_one :visualisation
  has_many :experiment_tasks
end
