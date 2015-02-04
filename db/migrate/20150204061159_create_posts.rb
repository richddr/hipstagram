class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
    	t.text :content
      t.string :picture
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :posts, :users
    add_index :posts, [:user_id, :created_at]
    add_index :hashtags, :name, unique: true
  end
end
