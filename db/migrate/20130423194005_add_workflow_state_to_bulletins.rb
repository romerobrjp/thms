class AddWorkflowStateToBulletins < ActiveRecord::Migration
  def change
    add_column :bulletins, :workflow_state, :string
  end
end
