class CreateIncomeTypes < ActiveRecord::Migration
  def change
    create_table :income_types do |t|
      t.string :name
      t.string :description
      t.references :townhouse

      t.timestamps
    end
    add_index :income_types, :townhouse_id
  end
end
