class AddDraftToCalls < ActiveRecord::Migration
  def change
    add_column :calls, :draft, :boolean, default: true
  end
end
