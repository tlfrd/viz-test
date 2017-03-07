class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.string :name
      t.references :visualisation, foreign_key: true
      t.string :type
      t.string :description

      t.timestamps
    end
  end
end
