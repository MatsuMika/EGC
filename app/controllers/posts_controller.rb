class PostsController < ApplicationController
  before_action :move_to_signed_in, except: [:index]
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]

	def new
		@post = Post.new
  end

 	def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to posts_path, notice: "投稿に成功しました"
    else
      render :new
    end
	end

  def index
  	@posts = Post.page(params[:page]).per(6)
  end

  def show
  	@post = Post.find(params[:id])
  	@post_comment = PostComment.new
    @post_comments = @post.post_comments
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to post_path(@post), notice: "正常に更新されました"
    else
      render "edit"
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  private

    def post_params
      params.require(:post).permit(:title, :subtitle, :post_image, :body, 
        :portfolio_url, :source_code_url, :body, :message, :development_environment_text)
    end

    def move_to_signed_in
      unless  user_signed_in?
        redirect_to new_user_session_path
      end
    end

    def ensure_correct_user
      @post = Post.find(params[:id])
      unless @post.user == current_user
        redirect_to posts_path
      end
    end

end

