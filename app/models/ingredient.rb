class Ingredient < ApplicationRecord
	validates :food, presence: true
	validates :quantity, presence: true
	validates :unit, presence: true

	belongs_to :recipe 

	# food - food concerned
	has_one :food
	
	# quantity - quantity of the food
	# unit - gram/unit/kilo
end
