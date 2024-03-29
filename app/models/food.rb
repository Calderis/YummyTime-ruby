class Food < ApplicationRecord

	# name - name of the ingredient
	# image - image of the food
	has_attached_file :image, styles: { medium: "180x180>", thumb: "60x42>" }, default_url: "/assets/defaults/placeholder.png"
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

	def image_url
		self.image.url(:medium)
	end

	def image_thumb
		self.image.url(:thumb)
	end
	def image_medium
		self.image.url(:medium)
	end

	def as_json(options = {})
		json = super(options)
		json['image_thumb'] = self.image_thumb
		json['image_medium'] = self.image_medium
		json
	end
end
