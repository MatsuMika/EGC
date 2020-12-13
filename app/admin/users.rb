ActiveAdmin.register User do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  #permit_params :email, :encrypted_password, :name, :nick_name, :reset_password_token, :reset_password_sent_at, :remember_created_at, :introduction, :avatar, :provider, :uid
  #
  # or
  #
  # permit_params do
  #   permitted = [:email, :encrypted_password, :name, :nick_name, :reset_password_token, :reset_password_sent_at, :remember_created_at, :introduction, :avatar]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  index do
    selectable_column
    id_column
    column :name
    column 'PF投稿数' do |user|
      user.posts.count
    end
    column :created_at
    column :updated_at
    actions
  end

  show do
    attributes_table do
      row :id
      row :name
      row :email
      row :encrypted_password
      row :nick_name
      row :introduction
      row :reset_password_token
      row :reset_password_sent_at
      row :remember_created_at
      row :created_at
      row :updated_at
      row :provider
      row :uid
      row :sign_in_count
      row :current_sign_in_at
      row :last_sign_in_at
      row :current_sign_in_ip
      row :last_sign_in_ip
      row :avatar do
        image_tag(user.avatar.url)
      end
    end
      panel "PF投稿一覧" do
        table_for user.posts do
          column :id
          column :title
          column :subtitle
          column :publish_date
        end
      end
    active_admin_comments
  end
end
