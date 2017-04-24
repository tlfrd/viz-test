require 'securerandom'

class ExperimentResult < ApplicationRecord
  has_many :experiment_task_results, dependent: :destroy
  belongs_to :experiment

  def self.generate_uuid
    return SecureRandom.uuid
  end

  def self.get_next_id
    max_id = self.maximum(:id)
    if max_id
      return max_id + 1
    else
      return 1
    end
  end
end
