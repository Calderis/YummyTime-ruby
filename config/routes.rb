Rails.application.routes.draw do
  # mount ForestLiana::Engine => '/forest'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :days
  resources :foods
  resources :ingredients
  resources :playlists
  resources :recipes
  resources :users
  resources :weeks
end
