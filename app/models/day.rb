class Day < ApplicationRecord
	validates :main, presence: true

	belongs_to :week

	# starter - starter recipe
	has_one :starter
	# has_one :starter, through: :recipe

	# main - main recipe
	has_one :main
	# has_one :main, through: :recipe

	# dessert - dessert recipe
	has_one :dessert
	# has_one :dessert, through: :recipe
end

class Monday < Day
end
class Tuesday < Day
end
class Wednesday < Day
end
class Thursday < Day
end
class Friday < Day
end
class Saturday < Day
end
class Sunday < Day
end