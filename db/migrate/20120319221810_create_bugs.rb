class CreateBugs < ActiveRecord::Migration
  def change
    create_table :bugs do |t|
      t.integer :user_id, :null => false
      t.string :author
      t.string :email
      t.text :description
      t.string :priority
      t.string :status

      t.timestamps
    end
    add_index :bugs, :user_id
  end
end
