Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users

	root 'homes#top'
	get 'homes/about'

	resources :users, only: [:show, :edit, :update]
end