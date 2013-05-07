class AddSubjectToBulletins < ActiveRecord::Migration
  def change
    add_column :bulletins, :subject, :string
  end
end
