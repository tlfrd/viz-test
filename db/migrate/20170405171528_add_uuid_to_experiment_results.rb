class AddUuidToExperimentResults < ActiveRecord::Migration[5.0]
  def change
    add_column :experiment_results, :uuid, :string
  end
end
