class Recipe < ApplicationRecord
	attr_accessor :ingredients_array
	
	validates :persons_amount, presence: true
	validates :description, presence: true
	validates :type_menu, presence: true
	validates :user, presence: true

	# ingredients - listes of ingredients
	has_many :ingredients, dependent: :destroy

	# persons_amount - number of persons to cook for
	# name - name of the recipe
	# description - cooking steps
	# image - image of the recipe
	has_attached_file :image, styles: { full: "660x280", medium: "300x110>", squared: "220x200", thumb: "120x84>" }, default_url: "/assets/defaults/placeholder.png"
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
	
	# type_menu - starter/main/dessert
	# count - number of used
	
	# user - user’s id
	belongs_to :user

	# followers - users that want to follow him
	has_many :followers

	def follow(user)
		if followed?(user)
			puts "Already followed"
		else
			puts "not followed"
			follw = Follower.new
			follw.follower_type = self.type_menu
			follw.follower = user
			follw.followed_id = self.id
			follw.save
		end
	end

	def followed?(user)
		Follower.where(follower_type: self.type_menu, followed_id:self.id, follower:user).count > 0
	end

	def followers
		Follower.where(follower_type: self.type_menu, followed_id:self.id)
	end
end
