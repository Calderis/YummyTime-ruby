class User < ApplicationRecord
	has_secure_password

	validates :name, presence: true
	validates :password, presence: true
	validates :mail, format: { with: /.*(.com)/, message: "Request a valid Email format" }
	validates :mail, uniqueness: true
	validates :image, format: { with: /.*(.jpg|jpeg|png)/i, message: "Request a valid Image url" }
	validates :image, presence: true
	validates :country, presence: true

	# name - first and last name or nickname
	# password - password used for login
	# image - image profil of the user
	before_save :default_values
	def default_values
		self.count ||= "https://eliaslealblog.files.wordpress.com/2014/03/user-200.png"
	end
	# mail - mail of the user : used for login
	# country - country of the user
	# week - current cooking planning
	has_one :week
	# users that want to follow him
	has_many :followers
end

class Author < User
	def find(id)
		User.find(id)
	end
end
class Follower < User
	def find(id)
		User.find(id)
	end
end
