class Day < ApplicationRecord
	validates :main, presence: true

	belongs_to :week

	# starter - starter recipe
	has_one :recipe, :as => :starter

	# main - main recipe
	has_one :recipe, :as => :main

	# dessert - dessert recipe
	has_one :recipe, :as => :dessert
end
