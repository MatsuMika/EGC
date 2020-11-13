class SearchController < ApplicationController
	def search
		@type = params[:type]
		@keyword = params[:keyword]
		@posts = if @type == 'user'
					Post.joins(:user).where('users.nick_name like ?', "%#{@keyword}%")
				 else
				 	Post.joins(:user).where('title like ? or subtitle like ? or development_environment_text like ?', "%#{@keyword}%", "%#{@keyword}%", "%#{@keyword}%")
				 end
		render "posts/index"
	end
end
