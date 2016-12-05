class User < ApplicationRecord
	# name - first and last name or nickname
	# password - password used for login
	# mail - mail of the user : used for login
	# country - country of the user
	# week - current cooking planning
	has_one :week
end
