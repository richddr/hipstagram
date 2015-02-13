class Hashtag < ActiveRecord::Base
	validates :name, presence: true, uniqueness: true
	# has_and_belongs_to_many :posts, class_name: "Post",
	# 																		 join_table: :hashtags_posts,
	# 																		 foreign_key: "hashtag_id"
end
