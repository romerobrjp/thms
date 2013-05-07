class CreateCalls < ActiveRecord::Migration
  def change
    create_table :calls do |t|
      t.string :subject
      t.text :message
      t.boolean :public
      t.references :tenement

      t.timestamps
    end
    add_index :calls, :tenement_id
  end
end
