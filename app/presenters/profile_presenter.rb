class ProfilePresenter

	attr_accessor :user

	def initialize(user)
		@user = user
	end

	def starters_count
		Follower.where(type: "starter", follower: @user).count
	end
	def starters
		Follower.where(type: "starter", follower: @user)
	end
	
	def mains_count
		Follower.where(type: "main", follower: @user).count
	end
	def mains
		Follower.where(type: "main", follower: @user)
	end

	def desserts_count
		Follower.where(type: "dessert", follower: @user).count
	end
	def desserts
		Follower.where(type: "dessert", follower: @user)
	end

	def cookbooks_followed
		Follower.where(type: "cookbook", follower: @user)
	end

	def followers_count
		Follower.where(type: "user", followed_id: @user.id).count
	end
end