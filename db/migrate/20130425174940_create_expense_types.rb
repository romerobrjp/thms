class CreateExpenseTypes < ActiveRecord::Migration
  def change
    create_table :expense_types do |t|
      t.string :name
      t.string :description
      t.references :townhouse

      t.timestamps
    end
    add_index :expense_types, :townhouse_id
  end
end
