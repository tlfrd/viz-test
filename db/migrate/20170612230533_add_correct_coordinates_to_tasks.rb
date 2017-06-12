class AddCorrectCoordinatesToTasks < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :correct_coordinates, :string, array: true, default: []
  end
end
