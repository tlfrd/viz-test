class CreateExperimentResults < ActiveRecord::Migration[5.0]
  def change
    create_table :experiment_results do |t|
      t.references :experiment_task_result, foreign_key: true

      t.timestamps
    end
  end
end
