class Recipe < ApplicationRecord
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
