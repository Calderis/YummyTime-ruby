class ProfilePresenter

	attr_accessor :user

	def initialize(user)
		@user_presenter = user
	end

	def user
		@user_presenter
	end

	def recipes_count
		(self.mains_count + self.desserts_count + self.starters_count)
	end
	def recipes
		(self.mains + self.desserts + self.starters).shuffle
	end

	def starters_count
		Follower.where(follower_type: "starter", follower: @user_presenter).count
	end
	def starters
		Follower.where(follower_type: "starter", follower: @user_presenter)
	end
	def mains_count
		Follower.where(follower_type: "main", follower: @user_presenter).count
	end
	def mains
		Follower.where(follower_type: "main", follower: @user_presenter)
	end

	def desserts_count
		Follower.where(follower_type: "dessert", follower: @user_presenter).count
	end
	def desserts
		Follower.where(follower_type: "dessert", follower: @user_presenter)
	end

	def cookbooks_followed
		Follower.where(follower_type: "cookbook", follower: @user_presenter)
	end
	def cookbooks_count
		Cookbook.where(user: @user_presenter).count
	end
	def cookbooks
		Cookbook.where(user: @user_presenter)
	end

	def followers_count
		Follower.where(follower_type: "user", followed_id: @user_presenter.id).count
	end
	def followers
		Follower.where(follower_type: "user", followed_id: @user_presenter.id)
	end
end