class CreateTenements < ActiveRecord::Migration
  def change
    create_table :tenements do |t|
      t.string :location
      t.decimal :rent_value
      t.references :user
      t.references :townhouse

      t.timestamps
    end
    add_index :tenements, :user_id
    add_index :tenements, :townhouse_id
  end
end
