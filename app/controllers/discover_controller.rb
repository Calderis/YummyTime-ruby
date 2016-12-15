class DiscoverController < ApplicationController
	def index
		cookbooks_ref = Follower.where(follower_type:"cookbook").group(:followed_id).count
		@most_followed_cookbooks = []

		# cookbooks_ref.each do |ref|
		# 	@most_followed_cookbooks = @most_followed_cookbooks + [Cookbook.find()]
		# end

		@most_used_cookbooks = Cookbook.order(count_time: :desc).first(20)
		@last_cookbooks = Cookbook.last(20)
		@last_recipes = Recipe.order(id: :desc).last(20)
	end
end
