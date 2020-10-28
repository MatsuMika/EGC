Rails.application.routes.draw do
  get 'posts/index'
  get 'posts/show'
  get 'posts/edit'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users

	root 'homes#top'
	get 'homes/about'

	resources :users, only: [:show, :edit, :update]

	resources :posts, only: [:new, :create, :index, :show, :destroy]
end