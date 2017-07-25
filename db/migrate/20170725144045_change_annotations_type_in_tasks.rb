class ChangeAnnotationsTypeInTasks < ActiveRecord::Migration[5.0]
  def change
    change_column :tasks, :annotations, :string
  end
end
