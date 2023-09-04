class ChangeColumnNameBugStatusToStatusInBugs < ActiveRecord::Migration[5.2]
  def change
    rename_column :bugs, :bug_status, :status
  end
end
