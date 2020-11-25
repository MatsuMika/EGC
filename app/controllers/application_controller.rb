class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?

	protected

	# ログイン後のリダイレクト先
  def after_sign_in_path_for(resource)
    case resource
    when User
      user_path(resource.id)
    when AdminUser
      admin_root_path
    end
  end

	# ログアウト後のリダイレクト先
  def after_sign_out_path_for(resource)
		root_path
  end

  def configure_permitted_parameters
  	devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :nick_name, :email])
  end
end
