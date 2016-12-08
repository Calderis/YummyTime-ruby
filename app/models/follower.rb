class Follower < ApplicationRecord

	# followed id of the object followed
	# follower user that follow
	belongs_to :follower, class_name: "User"
	# type define if it’s or a recipe, or a user or a cookbooks that is beeing followed
end
