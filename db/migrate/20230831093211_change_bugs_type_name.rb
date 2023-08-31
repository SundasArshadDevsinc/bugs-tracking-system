class ChangeBugsTypeName < ActiveRecord::Migration[5.2]
  def change
    rename_column :bugs, :type, :types
  end
end
