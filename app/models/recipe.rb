class Recipe < ApplicationRecord
	validates :persons_amount, presence: true
	validates :description, presence: true
	validates :image, format: { with: /.*(.jpg|jpeg|png)/i, message: "Request a valid Image url" }
	validates :image, presence: true
	validates :type_menu, presence: true
	validates :author_id, presence: true

	# ingredients - listes of ingredients
	has_many :ingredients, dependent: :destroy
	has_many :foods, through: :ingredients

	# persons_amount - number of persons to cook for
	# description - cooking steps
	# image - url to picture
	# type_menu - starter/main/dessert
	# count - number of used
	# author - author’s id
	has_one :user, :as => :author
end
