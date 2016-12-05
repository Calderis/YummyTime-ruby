class Week < ApplicationRecord
	validates :monday, presence: true
	validates :tuesday, presence: true
	validates :wednesday, presence: true
	validates :thursday, presence: true
	validates :friday, presence: true
	validates :saturday, presence: true
	validates :sunday, presence: true
	
	belongs_to :user

	# monday - what is planned for monday
	has_one :day, :as => :monday

	# tuesday - what is planned for tuesday
	has_one :day, :as => :tuesday

	# wednesday - what is planned for wednesday
	has_one :day, :as => :wednesday

	# thursday - what is planned for thursday
	has_one :day, :as => :thursday

	# friday - what is planned for friday
	has_one :day, :as => :friday

	# saturday - what is planned for saturday
	has_one :day, :as => :saturday

	# sunday - what is planned for sunday
	has_one :day, :as => :sunday
end
