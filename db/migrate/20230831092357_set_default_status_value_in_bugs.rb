class SetDefaultStatusValueInBugs < ActiveRecord::Migration[5.2]
  def change
    change_column_default :bugs, :status, 0
  end
end
