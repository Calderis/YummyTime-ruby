class Recipe < ApplicationRecord
	validates :persons_amount, presence: true
	validates :description, presence: true
	validates :type_menu, presence: true
	validates :author, presence: true

	# ingredients - listes of ingredients
	has_many :ingredients, dependent: :destroy

	# persons_amount - number of persons to cook for
	# name - name of the recipe
	# description - cooking steps
	# image - image of the recipe
	has_attached_file :image, styles: { full: "660x280", medium: "300x110>", squared: "220x200", thumb: "60x42>" }, default_url: "/assets/defaults/recipe.jpg"
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
	# type_menu - starter/main/dessert
	# count - number of used
	before_save :default_values
	def default_values
		self.count = 0
	end
	
	# author - author’s id
	belongs_to :author, class_name: "User"

	# followers - users that want to follow him
	has_many :followers
end
