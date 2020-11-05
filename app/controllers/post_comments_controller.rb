class PostCommentsController < ApplicationController

	def create
		@post = Post.find(params[:post_id])
    @post_comment = @post.post_comments.build(post_comment_params)
    @post_comment.user_id = current_user.id
    if @post_comment.save
      NoticeMailer.with(post_id:params[:post_id]).comment_created.deliver_now
      render :index
    end
  end

  def destroy
  	   @post_comment = PostComment.find(params[:id])
    if @post_comment.destroy
      render :index
  	end
	end

  	private
    	def post_comment_params
      	params.require(:post_comment).permit(:comment, :post_id, :user_id)
    	end
end
