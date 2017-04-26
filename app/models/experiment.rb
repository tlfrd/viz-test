class Experiment < ApplicationRecord
  has_many :experiment_tasks, dependent: :destroy
  has_many :experiment_results, dependent: :destroy
end
