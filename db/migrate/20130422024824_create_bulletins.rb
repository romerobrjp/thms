class CreateBulletins < ActiveRecord::Migration
  def change
    create_table :bulletins do |t|
      t.text :message
      t.references :syndic
      t.references :townhouse
      t.boolean :draft, :default => true
      t.timestamp :sent_at

      t.timestamps
    end
    add_index :bulletins, :syndic_id
    add_index :bulletins, :townhouse_id
  end
end
