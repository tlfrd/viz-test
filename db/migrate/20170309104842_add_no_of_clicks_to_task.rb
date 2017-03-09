class AddNoOfClicksToTask < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :no_of_clicks, :integer
  end
end
