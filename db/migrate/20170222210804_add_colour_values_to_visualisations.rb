class AddColourValuesToVisualisations < ActiveRecord::Migration[5.0]
  def change
    add_column :visualisations, :colour_values, :json
  end
end
