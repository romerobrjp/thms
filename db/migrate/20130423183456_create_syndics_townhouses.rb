class CreateSyndicsTownhouses < ActiveRecord::Migration
  def change
    create_table :syndics_townhouses, id: false do |t|
      t.references :syndic
      t.references :townhouse
    end
    add_index :syndics_townhouses, :syndic_id
    add_index :syndics_townhouses, :townhouse_id
  end
end
