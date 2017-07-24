class AddActiveToExperiments < ActiveRecord::Migration[5.0]
  def change
    add_column :experiments, :active, :boolean
  end
end
