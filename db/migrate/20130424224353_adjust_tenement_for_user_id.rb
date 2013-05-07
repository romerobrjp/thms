class AdjustTenementForUserId < ActiveRecord::Migration
  def up
    add_column :tenements, :tenant_id, :integer
    remove_column :tenements, :user_id

    add_index :tenements, :tenant_id
  end

  def down
    add_column :tenements, :user_id, :integer
    remove_column :tenements, :tenant_id

    add_index :tenements, :user_id
  end
end
