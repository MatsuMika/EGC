Rails.application.routes.draw do

  get 'posts/index'
  get 'posts/show'
  get 'posts/edit'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: "users/registrations",
    omniauth_callbacks: "users/omniauth_callbacks"
  }

	root 'homes#top'
	get 'homes/about'
  get 'search/search'

	resources :users, only: [:show, :edit, :update]

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end

	resources :posts do
    resource :favorites, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy] do
    resources :replies, only: [:create, :destroy]
    end
  end

end