class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.integer :bug_id
      t.string :body, :null => false

      t.timestamps
    end
    
    add_index :comments, [:user_id, :bug_id]
  end
end
