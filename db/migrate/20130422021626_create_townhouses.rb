class CreateTownhouses < ActiveRecord::Migration
  def change
    create_table :townhouses do |t|
      t.string :name
      t.string :information

      t.timestamps
    end
  end
end
