class User < ApplicationRecord
	has_secure_password

	validates :name, presence: true
	validates :mail, uniqueness: true
	validates :country, presence: true


	# name - first and last name or nickname
	# password - password used for login
	# image - image profil of the user
	has_attached_file :image, styles: { medium: "280x280>", thumb: "42x42>" }, default_url: "/assets/defaults/user.png"
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
	
	# mail - mail of the user : used for login
	# country - country of the user
	# week - current cooking planning
	has_one :week
	# followers - users that want to follow him
	has_many :followers
	# cookbooks - Cookbooks the user made himself
	has_many :cookbooks

	def follow(user)
		if followed?(user)
			puts "Already followed"
		else
			puts "not followed"
			follw = Follower.new
			follw.follower_type = "user"
			follw.follower = user
			follw.followed_id = self.id
			follw.save
		end
	end

	def cookbook_count
		Cookbook.where(user: self).count
	end
	def recipes_count
		@profile_presenter = ProfilePresenter.new(self)
		@profile_presenter.recipes_count
	end
	def recipes
		Recipe.where(user: self)
	end
	def cookbooks
		Cookbook.where(user: self)
	end

	def followed?(user)
		Follower.where(follower_type: "user", followed_id:self.id, follower:user).count > 0
	end

	def followers
		Follower.where(follower_type: "user", followed_id:self.id)
	end

	def week
		if !self.week_id.nil?
			Week.find(self.week_id)
		else
			nil
		end
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
