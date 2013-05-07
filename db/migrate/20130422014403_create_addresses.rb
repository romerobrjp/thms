class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :street
      t.integer :number
      t.string :district
      t.string :zip_code
      t.string :complement
      t.references :city
      t.references :addressable, polymorphic: true

      t.timestamps
    end
    add_index :addresses, :city_id
    add_index :addresses, :addressable_id
  end
end
