class RemoveUrlsFromVisualisations < ActiveRecord::Migration[5.0]
  def change
    remove_column :visualisations, :json_url
    remove_column :visualisations, :csv_url
    remove_column :visualisations, :colour_values
  end
end
