class Visualisation < ApplicationRecord
  has_many :tasks, dependent: :destroy
end
