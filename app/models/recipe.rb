class Recipe < ApplicationRecord
	validates :persons_amount, presence: true
	validates :description, presence: true
	validates :image, format: { with: /[A-Za-z]+\.(gif|jpg|png)$/i, message: "Request a valid Image url" }
	validates :image, presence: true
	validates :type, presence: true
	validates :author, presence: true

	# ingredients - listes of ingredients
	has_many :ingredients, dependent: :destroy

	# persons_amount - number of persons to cook for
	# description - cooking steps
	# image - url to picture
	# type - starter/main/dessert
	# count - number of used
	# author - author’s id
	has_one :user, :as => :author
end
