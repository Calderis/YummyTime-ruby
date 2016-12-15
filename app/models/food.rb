class Food < ApplicationRecord

	# name - name of the ingredient
	# image - image of the food
	has_attached_file :image, styles: { medium: "180x180>", thumb: "60x42>" }, default_url: "/assets/defaults/placeholder.png"
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

	def image_url
		self.image.url(:medium)
	end
end
