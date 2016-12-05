class Playlist < ApplicationRecord
	validates :persons_amount, presence: true
	validates :description, presence: true
	validates :author, presence: true
	
	# recipes - list of recipes
	has_many :recipes

	# persons_amount - number of persons - recipe with different number of persons forbidden
	# description - description of the playlist
	# count - number of used
	# author - author’s id
	has_one :user, :as => :author
	
	# followers - list of followers
	has_many :users, :as => :followers
end
