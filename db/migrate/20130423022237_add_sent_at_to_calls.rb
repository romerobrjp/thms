class AddSentAtToCalls < ActiveRecord::Migration
  def change
    add_column :calls, :sent_at, :timestamp
  end
end
