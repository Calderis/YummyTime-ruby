class Day < ApplicationRecord
	validates :main, presence: true

	belongs_to :week

	# starter - starter recipe
	has_one :recipe, :as => :starter
	has_many :starter, through: :recipe

	# main - main recipe
	has_one :recipe, :as => :main
	has_many :main, through: :recipe

	# dessert - dessert recipe
	has_one :recipe, :as => :dessert
	has_many :dessert, through: :recipe
end
