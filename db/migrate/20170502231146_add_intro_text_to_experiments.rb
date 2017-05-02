class AddIntroTextToExperiments < ActiveRecord::Migration[5.0]
  def change
    add_column :experiments, :intro_html, :text
  end
end
