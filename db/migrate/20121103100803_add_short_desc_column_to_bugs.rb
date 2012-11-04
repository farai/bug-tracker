class AddShortDescColumnToBugs < ActiveRecord::Migration
  def change
    add_column :bugs, :short_desc, :string
  end
end
