class AddJsonToVisualisations < ActiveRecord::Migration[5.0]
  def change
    add_column :visualisations, :json_urL, :string
  end
end
