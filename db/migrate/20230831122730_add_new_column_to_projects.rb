class AddNewColumnToProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :assignee_ids, :integer, array: true
  end
end
