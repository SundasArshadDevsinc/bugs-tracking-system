class RemoveAssigneeIdIndexFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_index :users, name: "index_users_on_assignee_id"
  end
end
