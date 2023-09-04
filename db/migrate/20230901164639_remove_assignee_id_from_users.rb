class RemoveAssigneeIdFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :assignee_id, :bigint
  end
end
