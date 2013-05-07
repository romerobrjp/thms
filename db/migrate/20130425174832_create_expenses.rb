class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.references :type
      t.string :description
      t.date :date
      t.decimal :value
      t.references :townhouse

      t.timestamps
    end
    add_index :expenses, :type_id
  end
end
