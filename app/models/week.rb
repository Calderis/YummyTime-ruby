class Week < ApplicationRecord
	validates :monday, presence: true
	validates :tuesday, presence: true
	validates :wednesday, presence: true
	validates :thursday, presence: true
	validates :friday, presence: true
	validates :saturday, presence: true
	validates :sunday, presence: true
	validates :cookbook, presence: true
	validates :user, presence: true
	
	belongs_to :user

	# cookbook - cookbook the week come from
	has_one :cookbook

	# monday - what is planned for monday
	has_one :monday, class_name: "Day"

	# tuesday - what is planned for tuesday
	has_one :tuesday, class_name: "Day"

	# wednesday - what is planned for wednesday
	has_one :wednesday, class_name: "Day"

	# thursday - what is planned for thursday
	has_one :thursday, class_name: "Day"

	# friday - what is planned for friday
	has_one :friday, class_name: "Day"

	# saturday - what is planned for saturday
	has_one :saturday, class_name: "Day"

	# sunday - what is planned for sunday
	has_one :sunday, class_name: "Day"
end
