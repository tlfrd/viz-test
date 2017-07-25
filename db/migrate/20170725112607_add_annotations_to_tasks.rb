class AddAnnotationsToTasks < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :annotations, :string, array: true, default: []
  end
end
