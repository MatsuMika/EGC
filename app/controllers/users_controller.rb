class UsersController < ApplicationController
  before_action :authenticate_user!
	before_action :ensure_correct_user, only: [:edit, :update]

  def show
  	@user = User.find(params[:id])

    favorites = Favorite.where(user_id: current_user.id).pluck(:post_id)
    @favorite_list = Post.find(favorites)
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
    if @user.update(user_params)
    	@user = User.find(params[:id])
      redirect_to user_path(@user), notice: "正常に更新されました"
    else
      render "edit"
    end
   end

	private

		def user_params
		params.require(:user).permit(:name, :email, :nick_name, :introduction, :avatar)
		end

		def ensure_correct_user
			@user = User.find(params[:id])
			unless @user == current_user
			  redirect_to user_path(current_user)
			end
		end

end