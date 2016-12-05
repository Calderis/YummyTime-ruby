class Food < ApplicationRecord
	# attr_accessor :name, :image

	validates :name, presence: true
	validates :image, format: { with: /[A-Za-z]+\.(gif|jpg|png)/i, message: "Request a valid Image url" }

	# name - name of the ingredient
	# image - url to picture
	# count - number of used
end
