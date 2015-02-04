class Post < ActiveRecord::Base
  belongs_to :user
  default_scope -> {order(created_at: :desc)}
  mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  # validates :content, presence: true, length: {maximum: 140}
  validate :picture_size

  # has_and_belongs_to_many :hashtags, class_name: "Hashtag",
  #                                    join_table: :hashtags_microposts,
  #                                    foreign_key: "micropost_id",
  #                                    dependent: :destroy
  after_create :analyze_post
  private

  	# validates the size of an uploaded picture.
  	def picture_size
  		if picture.size > 5.megabytes
  			errors.add(:picture, "should be less than 5MB")
  		end
  	end

    def analyze_post
      # analyze content
      hashtags_found = self.content.scan(/\B#\w+/).map { |ht| ht.delete("#").downcase  }
      if hashtags_found
        hashtags_found.each do |ht|
          # if its a new hashtag
          if Hashtag.where(name: ht).empty?
            hashtags << Hashtag.create!(name: ht)
          else
            hashtags << Hashtag.where(name: ht).first
          end
        end
      end
    end
end
