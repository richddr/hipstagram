class CreateHashtagsPostsJoin < ActiveRecord::Migration
  def change
    create_join_table :hashtags, :posts, table_name: :hashtags_posts do |t|
      t.index [:hashtag_id, :post_id], unique: true
    end
    add_foreign_key :hashtags_posts, :hashtags
  	add_foreign_key :hashtags_posts, :posts
  end
end
