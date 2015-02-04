class Hashtag < ActiveRecord::Base
	validates :name, presence: true, uniqueness: true
	# has_and_belongs_to_many :microposts, class_name: "Micropost",
	# 																		 join_table: :hashtags_microposts,
	# 																		 foreign_key: "hashtag_id"
end
