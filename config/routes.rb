Rails.application.routes.draw do

	resources :playlists
	resources :recipes
	resources :users
	resources :weeks
	resources :days
	resources :ingredients
	resources :foods
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
