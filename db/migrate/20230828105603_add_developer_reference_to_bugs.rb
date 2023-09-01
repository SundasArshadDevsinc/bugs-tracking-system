class AddDeveloperReferenceToBugs < ActiveRecord::Migration[5.2]
  def change
    add_reference :bugs, :developer, null: true,  foreign_key: { to_table: :users }
  end
end
