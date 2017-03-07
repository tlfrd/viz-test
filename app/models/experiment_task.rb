class ExperimentTask < ApplicationRecord
  belongs_to :experiment
  belongs_to :task
end
