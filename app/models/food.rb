class Food < ApplicationRecord

	# name - name of the ingredient
	# image - image of the food
	has_attached_file :image, styles: { medium: "180x180>", thumb: "60x42>" }, default_url: "/assets/defaults/placeholder.png"
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

	# count - number of used
	before_save :default_values
	def default_values
		self.count_time = 0
	end
end
