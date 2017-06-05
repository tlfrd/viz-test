class Visualisation < ApplicationRecord
  has_many :tasks, dependent: :destroy

  # write something to show all visualisations connected
  def self.get_experiments(visualisation_id)
    viz = Visualisation.find_by_id(visualisation_id)
  end
end
