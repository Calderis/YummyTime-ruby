Rails.application.routes.draw do

	resources :registries
	get 'sessions/new'

	get 'discover/sandbox'
	get 'discover/index'
	root 'discover#index'

	get '/recipes/:id/ingredients', to: 'recipes#ingredients', as: 'recipe_ingredients'
	post '/recipes/follow/:id', to: 'recipes#follow', as: 'recipe_follow'
	delete '/recipes/follow/:id', to: 'recipes#unfollow', as: 'recipe_unfollow'

	get '/cookbooks/:id/recipes', to: 'cookbooks#recipes', as: 'cookbook_recipes'
	post '/cookbooks/follow/:id', to: 'cookbooks#follow', as: 'cookbook_follow'
	delete '/cookbooks/follow/:id', to: 'cookbooks#unfollow', as: 'cookbook_unfollow'

	post '/users/follow/:id', to: 'users#follow', as: 'user_follow'
	delete '/users/follow/:id', to: 'users#unfollow', as: 'user_unfollow'

	get '/weeks/:id/cart', to: 'weeks#cart', as: 'week_cart'

	get '/users/famous', to: 'users#famous', as: 'users_famous'

	resources :cookbooks
	resources :recipes
	resources :users
	resources :weeks
	resources :days
	resources :ingredients
	resources :foods
	resources :sessions
	resources :followers

	resources :header
	resources :sidebarleft
	resources :sidebarrigth

	get 'signup', to: 'users#new', as: 'signup'
	get 'login', to: 'sessions#new', as: 'login'
	post 'login', to: 'sessions#create', as: 'login_api'
	get 'logout', to: 'sessions#destroy', as: 'logout'
end
