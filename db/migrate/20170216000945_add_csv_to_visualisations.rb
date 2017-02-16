class AddCsvToVisualisations < ActiveRecord::Migration[5.0]
  def change
    add_column :visualisations, :csv_urL, :string
  end
end
