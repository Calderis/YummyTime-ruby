class Day < ApplicationRecord
	belongs_to :week

	# starter - starter recipe
	has_one :recipe, :as => :starter

	# main - main recipe
	has_one :recipe, :as => :main

	# dessert - dessert recipe
	has_one :recipe, :as => :dessert
end
