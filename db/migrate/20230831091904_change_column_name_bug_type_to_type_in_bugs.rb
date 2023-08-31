class ChangeColumnNameBugTypeToTypeInBugs < ActiveRecord::Migration[5.2]
  def change
    rename_column :bugs, :bug_type, :type
  end
end
