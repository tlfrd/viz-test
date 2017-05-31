class AddInputTypeToExperimentResults < ActiveRecord::Migration[5.0]
  def change
    add_column :experiment_results, :input_type, :string
  end
end
