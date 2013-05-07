class AddStateIdToAddresses < ActiveRecord::Migration
  def change
    add_column :addresses, :state_id, :integer

    add_index :addresses, :state_id
  end
end
