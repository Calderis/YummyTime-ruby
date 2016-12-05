Rails.application.routes.draw do

	get 'sessions/new'

	get 'discover/index'
	root 'discover#index'

	resources :playlists
	resources :recipes
	resources :users
	resources :weeks
	resources :days
	resources :ingredients
	resources :foods
	resources :sessions

	get 'signup', to: 'users#new', as: 'signup'
	get 'login', to: 'sessions#new', as: 'login'
	get 'logout', to: 'sessions#destroy', as: 'logout'
end
