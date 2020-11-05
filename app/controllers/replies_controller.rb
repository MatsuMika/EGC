class RepliesController < ApplicationController
	def create
		@post_comment = PostComment.find(params[:post_comment_id])
	  @reply = @post_comment.replies.build(reply_params)
	  @reply.user_id = current_user.id
	  if @reply.save
      NoticeMailer.with(post_comment_id:params[:post_comment_id]).reply_created.deliver_now
	    render :index
	   end
  end

  def destroy
  	@reply = Reply.find(params[:id])
    if @reply.destroy
      render :index
  	end
	end

  private
  	def reply_params
    	params.require(:reply).permit(:comment, :post_comment_id, :user_id)
  	end
end
