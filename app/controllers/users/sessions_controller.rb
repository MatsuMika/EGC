# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in

  def new
    self.resource = resource_class.new(sign_in_params)
    if params[:user]
      if params[:user][:email].present?
        resource.errors.add(:base, "メールアドレスまたはパスワードが誤っています")
      else
        resource.errors.add(:email, "が入力されていません")
      end
    end
    clean_up_passwords(resource)
    yield resource if block_given?
    respond_with(resource, serialize_options(resource))
  end

  # POST /resource/sign_in
  #def create
  #  super
  #end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  def new_guest
    @user = User.guest
    sign_in @user
    redirect_to user_path(@user), notice: 'ゲストユーザーとしてログインしました'
  end
end