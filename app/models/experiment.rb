class Experiment < ApplicationRecord
  has_many :experiment_tasks
  has_many :experiment_results
end
