class Cookbook < ApplicationRecord
	validates :persons_amount, presence: true
	validates :description, presence: true
	validates :author, presence: true
	
	# recipes - list of recipes
	has_many :recipes

	# persons_amount - number of persons - recipe with different number of persons forbidden
	# description - description of the playlist
	# count - number of used
	before_save :default_values
	def default_values
		self.count = 0
	end
	
	# author - author’s id
	belongs_to :author, class_name: "User"
	
	# followers - list of followers
	has_many :followers
end
