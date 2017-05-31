class AddDeviceTypeToExperimentResults < ActiveRecord::Migration[5.0]
  def change
    add_column :experiment_results, :device_type, :string
  end
end
