class Cookbook < ApplicationRecord
	validates :persons_amount, presence: true
	validates :description, presence: true
	validates :user, presence: true
	
	# recipes - list of recipes
	has_many :recipes
	def recipes
		[]
	end

	# persons_amount - number of persons - recipe with different number of persons forbidden
	# name - name  of the cookbook
	# description - description of the cookbook
	# count - number of used

	# image - cookbook banner
	has_attached_file :image, styles: { full: "660x270",banner: "800x180>", thumb: "280x250>" }, default_url: "/assets/defaults/placeholder.png"
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
	
	# user - author’s id
	belongs_to :user
	
	# followers - list of followers
	def follow(user)
		if followed?(user)
			puts "Already followed"
		else
			puts "not followed"
			follw = Follower.new
			follw.follower_type = "cookbook"
			follw.follower = user
			follw.followed_id = self.id
			follw.save
		end
	end

	def followed?(user)
		Follower.where(follower_type: "cookbook", followed_id:self.id, follower:user).count > 0
	end

	def followers
		Follower.where(follower_type: "cookbook", followed_id:self.id)
	end

	def add_recipe(recipe)
		registry = Registry.new
		registry.cookbook = self
		registry.recipe = recipe
		registry.save
		redirect_to self
	end
end
