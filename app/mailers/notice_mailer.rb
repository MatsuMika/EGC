class NoticeMailer < ApplicationMailer

  def comment_created
  	@post = Post.find(params[:post_id])
    @user = @post.user
    mail to:      @user.email,
         subject: 'コメントが届きました'
  end

  def reply_created
  	post_comment = PostComment.find(params[:post_comment_id])
    @post = post_comment.post
    @user = post_comment.user

    mail to:      @user.email,
         subject: '返信が届きました'
  end

end
