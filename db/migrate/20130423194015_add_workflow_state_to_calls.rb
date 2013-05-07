class AddWorkflowStateToCalls < ActiveRecord::Migration
  def change
    add_column :calls, :workflow_state, :string
  end
end
