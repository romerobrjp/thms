class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.text :message
      t.references :user
      t.references :parent
      t.references :answerable, polymorphic: true

      t.timestamps
    end
    add_index :answers, :user_id
    add_index :answers, :parent_id
    add_index :answers, :answerable_id
    add_index :answers, :answerable_type
  end
end
