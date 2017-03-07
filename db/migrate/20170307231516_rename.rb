class Rename < ActiveRecord::Migration[5.0]
  def change
    rename_column :visualisations, :json_urL, :json_url
    rename_column :visualisations, :csv_urL, :csv_url
  end
end
