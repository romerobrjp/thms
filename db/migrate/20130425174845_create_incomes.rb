class CreateIncomes < ActiveRecord::Migration
  def change
    create_table :incomes do |t|
      t.references :type
      t.string :description
      t.date :date
      t.decimal :value
      t.references :townhouse

      t.timestamps
    end
    add_index :incomes, :type_id
  end
end
