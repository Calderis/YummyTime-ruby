class DiscoverController < ApplicationController
	def index
		
	end

	def sandbox
		puts "Yo les gars!!"
		# create_food
		render :index
	end

	def create_food
		@food = Food.new(name: "Tomato", image:"http://vectorboom.com/TUTORIALS/Tomato/0.jpg", count: 0)
		puts @food.to_json
		if @food.save
			puts "food ok"
		else
			puts "pas ok"
			puts @food.errors.to_json
		end
	end

	def create_recipe
		# @recipe = Recipe.new(persons_amount: 1, description: "test", image: "https://www.wendys.com/ccurl/122/802/Kids_AppleSlicesRED_205x205.png", type_menu:"dessert", author:Author.find(1))
		
		# @recipe = Recipe.find(1)
		# @recipe.ingredients = [Ingredient.new(food_id: Food.find(1).id, quantity: 1, unit: "unit")]
		
		# if @recipe.save
		# 	puts "recipe ok"
		# else
		# 	puts @recipe.errors.to_json
		# end

		# ingredients = [ingA];
	end

	def create_cookbook
	end
end
