class CreateExperimentTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :experiment_tasks do |t|
      t.references :experiment, foreign_key: true
      t.references :task, foreign_key: true
      t.integer :order

      t.timestamps
    end
  end
end
