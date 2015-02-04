class AddIndexToComments < ActiveRecord::Migration
  def change
  	add_index :comments, [:user_id, :post_id, :created_at], unique: true
  end
end
