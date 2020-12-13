ActiveAdmin.register Post do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  #permit_params :user_id, :title, :subtitle, :post_image, :portfolio_url, :source_code_url, :body, :message, :development_environment_text
  #
  # or
  #
  # permit_params do
  #   permitted = [:user_id, :title, :subtitle, :post_image, :portfolio_url, :source_code_url, :body, :message, :development_environment_text]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  index do
    selectable_column
    id_column
    column :user
    column :title
    column :subtitle
    column :body
    column :development_environment_text
    column :message
    column :created_at
    column :updated_at
    actions
  end

  show do
    attributes_table do
      row :id
      row :user
      row :title
      row :subtitle
      row :body
      row :development_environment_text
      row :message
      row :portfolio_url
      row :source_code_url
      row :created_at
      row :updated_at
      row :post_image do
        image_tag(post.post_image.thumb.url)
      end
    end
  end

end