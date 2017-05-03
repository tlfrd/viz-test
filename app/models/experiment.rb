require 'securerandom'

class Experiment < ApplicationRecord
  has_many :experiment_tasks, dependent: :destroy
  has_many :experiment_results, dependent: :destroy

  def self.generate_uuid
    return SecureRandom.uuid
  end
end
