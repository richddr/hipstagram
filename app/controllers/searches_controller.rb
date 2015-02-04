class SearchesController < ApplicationController

	def search
		# determine if its a user or a hashtag search
		if params[:search]
			search = params[:search].split()
			if search[0][0] == "#"
				# search ht
				@search_type = :hashtag
				@title = "Hashtag Search"
				@results = if !Hashtag.where(name: search[0].delete("#").downcase).empty?
										Hashtag.where(name: search[0].delete("#").downcase).first.microposts.paginate(page: params[:page])
									 else; []; end
			else
				# search user
				@search_type = :user
				@title = "User Search"
				@results = User.where("username LIKE ?", "%#{search[0].delete("@").downcase}%").paginate(page: params[:page])
			end
			
			render 'search_results'
		end
	end
end
