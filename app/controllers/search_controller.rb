class SearchController < ApplicationController
	def search
		@keyword = params[:title]
		@posts = Post.where('title like ?',"%#{@keyword}%")
		render "posts/index"
	end
end
