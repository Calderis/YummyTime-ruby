class CookbookPresenter

	attr_accessor :cookbook

	def initialize(cookbook)
		@cookbook_presenter = cookbook
		@registries = Registry.where(cookbook_id: @cookbook_presenter.id)
		
		@recipes = []
		@starters = []
		@mains = []
		@desserts = []

		@registries.each do |ref|
			recipe = Recipe.find(ref.recipe_id)
			if recipe.type_menu == "starter"
				@starters = @starters + [recipe]
			end
			if recipe.type_menu == "main"
				@mains = @mains + [recipe]
			end
			if recipe.type_menu == "dessert"
				@desserts = @desserts + [recipe]
			end
			@recipes = @recipes + [recipe]
		end
	end

	def recipes_count
		@recipes.count
	end
	def recipes
		@recipes
	end

	def starters_count
		@starters.count
	end
	def starters
		@starters
	end
	def starter_random_id
		starter = @starters.sample
		starter.ingredients.each do |ingredient|
			ingredient.food.count_time = ingredient.food.count_time + 1
			ingredient.food.save
		end
		starter.count_time = starter.count_time + 1
		starter.save
		starter.id
	end

	def mains_count
		@mains.count
	end
	def mains
		@mains
	end
	def main_random_id
		main = @mains.sample
		main.ingredients.each do |ingredient|
			ingredient.food.count_time = ingredient.food.count_time + 1
			ingredient.food.save
		end
		main.count_time = main.count_time + 1
		main.save
		main.id
	end

	def desserts_count
		@desserts.count
	end
	def desserts
		@desserts
	end
	def dessert_random_id
		dessert = @desserts.sample
		dessert.ingredients.each do |ingredient|
			ingredient.food.count_time = ingredient.food.count_time + 1
			ingredient.food.save
		end
		dessert.count_time = dessert.count_time + 1
		dessert.save
		dessert.id
	end
end