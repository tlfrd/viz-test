class AddHtmlToVisualisations < ActiveRecord::Migration[5.0]
  def change
    add_column :visualisations, :html, :text
  end
end
  
