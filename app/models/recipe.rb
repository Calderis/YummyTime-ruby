class Recipe < ApplicationRecord
	validates :persons_amount, presence: true
	validates :description, presence: true
	validates :image, format: { with: /.*(.jpg|jpeg|png)/i, message: "Request a valid Image url" }
	validates :image, presence: true
	validates :type_menu, presence: true
	validates :author, presence: true

	# ingredients - listes of ingredients
	has_many :ingredients, dependent: :destroy

	# persons_amount - number of persons to cook for
	# description - cooking steps
	# image - url to picture
	# type_menu - starter/main/dessert
	# count - number of used
	before_save :default_values
	def default_values
		self.count = 0
	end
	
	# author - author’s id
	belongs_to :author
end

class Starter < User
end
class Main < User
end
class Dessert < User
end
