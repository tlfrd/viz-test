class AddUuidToExperiment < ActiveRecord::Migration[5.0]
  def change
    add_column :experiments, :uuid, :string
  end
end
