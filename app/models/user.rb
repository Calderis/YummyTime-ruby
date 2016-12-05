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
	# mail - mail of the user : used for login
	# country - country of the user
	# week - current cooking planning
	has_one :week
end
