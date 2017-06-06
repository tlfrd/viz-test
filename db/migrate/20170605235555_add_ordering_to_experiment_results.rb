class AddOrderingToExperimentResults < ActiveRecord::Migration[5.0]
  def change
    add_column :experiment_results, :ordering, :string, array: true, default: []
  end
end
