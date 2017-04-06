class AddCompletedToExperimentResults < ActiveRecord::Migration[5.0]
  def change
    add_column :experiment_results, :completed, :boolean
  end
end
