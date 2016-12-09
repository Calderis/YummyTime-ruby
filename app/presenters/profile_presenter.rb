class ProfilePresenter

	attr_accessor :user

	def initialize(user)
		@user = user
	end

	def starters_count
		Follower.where(follower_type: "starter", follower: @user).count
	end
	def starters
		Follower.where(follower_type: "starter", follower: @user)
	end
	def mains_count
		Follower.where(follower_type: "main", follower: @user).count
	end
	def mains
		Follower.where(follower_type: "main", follower: @user)
	end

	def desserts_count
		Follower.where(follower_type: "dessert", follower: @user).count
	end
	def desserts
		Follower.where(follower_type: "dessert", follower: @user)
	end

	def cookbooks_followed
		Follower.where(follower_type: "cookbook", follower: @user)
	end
	def cookbooks_count
		Cookbook.where(user: @user).count
	end
	def cookbooks
		Cookbook.where(user: @user)
	end

	def followers_count
		Follower.where(follower_type: "user", followed_id: @user.id).count
	end
	def followers
		Follower.where(follower_type: "user", followed_id: @user.id)
	end
end