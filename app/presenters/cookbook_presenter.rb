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

	def mains_count
		@mains.count
	end
	def mains
		@mains
	end

	def desserts_count
		@desserts.count
	end
	def desserts
		@desserts
	end
end