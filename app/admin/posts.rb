ActiveAdmin.register Post do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
   permit_params :user_id, :title, :subtitle, :post_image, :portfolio_url, :source_code_url, :body, :message, :development_environment_text
  #
  # or
  #
  # permit_params do
  #   permitted = [:user_id, :title, :subtitle, :post_image, :portfolio_url, :source_code_url, :body, :message, :development_environment_text]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

end
