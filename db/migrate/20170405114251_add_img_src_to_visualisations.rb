class AddImgSrcToVisualisations < ActiveRecord::Migration[5.0]
  def change
    add_column :visualisations, :img_src, :string
  end
end
