class User < ApplicationRecord
	has_secure_password

	validates :name, presence: true
	validates :mail, uniqueness: true
	validates :country, presence: true


	# name - first and last name or nickname
	# password - password used for login
	# image - image profil of the user
	has_attached_file :image, styles: { medium: "140x140>", thumb: "21x21>" }, default_url: "/assets/defaults/user.png"
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
	
	# mail - mail of the user : used for login
	# country - country of the user
	# week - current cooking planning
	has_one :week
	# followers - users that want to follow him
	has_many :followers
end
