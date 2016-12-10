class Day < ApplicationRecord
	validates :main, presence: true

	belongs_to :week

	# starter - starter recipe
	has_one :starter, class_name: "Recipe"
	# has_one :starter, through: :recipe

	# main - main recipe
	has_one :main, class_name: "Recipe"
	# has_one :main, through: :recipe

	# dessert - dessert recipe
	has_one :dessert, class_name: "Recipe"
	# has_one :dessert, through: :recipe
end