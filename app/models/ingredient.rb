class Ingredient < ApplicationRecord
	belongs_to :recipe 

	# food - food concerned
	has_one :food
	
	# quantity - quantity of the food
	# unit - gram/unit/kilo
end
