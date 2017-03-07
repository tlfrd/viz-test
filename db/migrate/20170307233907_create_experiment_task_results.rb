class CreateExperimentTaskResults < ActiveRecord::Migration[5.0]
  def change
    create_table :experiment_task_results do |t|
      t.json :result
      t.references :experiment_task, foreign_key: true

      t.timestamps
    end
  end
end
