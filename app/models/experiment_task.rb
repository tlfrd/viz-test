class ExperimentTask < ApplicationRecord
  belongs_to :experiment
  has_one :task
end
