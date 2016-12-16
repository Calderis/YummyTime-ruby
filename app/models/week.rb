class Week < ApplicationRecord
	validates :cookbook_id, presence: true
	
	belongs_to :user

	# cookbook - cookbook the week come from

	# monday - what is planned for monday
	has_one :monday, class_name: "Day", dependent: :nullify

	# tuesday - what is planned for tuesday
	has_one :tuesday, class_name: "Day", dependent: :nullify

	# wednesday - what is planned for wednesday
	has_one :wednesday, class_name: "Day", dependent: :nullify

	# thursday - what is planned for thursday
	has_one :thursday, class_name: "Day", dependent: :nullify

	# friday - what is planned for friday
	has_one :friday, class_name: "Day", dependent: :nullify

	# saturday - what is planned for saturday
	has_one :saturday, class_name: "Day", dependent: :nullify

	# sunday - what is planned for sunday
	has_one :sunday, class_name: "Day", dependent: :nullify

	def cookbook
		Cookbook.find(self.cookbook_id)
	end

	def monday
		Day.where(week_id: self.id).first
	end
	def tuesday
		Day.where(week_id: self.id).offset(1).first
	end
	def wednesday
		Day.where(week_id: self.id).offset(2).first
	end
	def thursday
		Day.where(week_id: self.id).offset(3).first
	end
	def friday
		Day.where(week_id: self.id).offset(4).first
	end
	def saturday
		Day.where(week_id: self.id).offset(5).first
	end
	def sunday
		Day.where(week_id: self.id).offset(6).first
	end

	def ingredients
		ingredients = []

		# monday
		if !self.monday.starter.nil?
			ingredients = ingredients + self.monday.starter.ingredients
		end
		if !self.monday.main.nil?
			ingredients = ingredients + self.monday.main.ingredients
		end
		if !self.monday.dessert.nil?
			ingredients = ingredients + self.monday.dessert.ingredients
		end

		# tuesday
		if !self.tuesday.starter.nil?
			ingredients = ingredients + self.tuesday.starter.ingredients
		end
		if !self.tuesday.main.nil?
			ingredients = ingredients + self.tuesday.main.ingredients
		end
		if !self.tuesday.dessert.nil?
			ingredients = ingredients + self.tuesday.dessert.ingredients
		end

		# wednesday
		if !self.wednesday.starter.nil?
			ingredients = ingredients + self.wednesday.starter.ingredients
		end
		if !self.wednesday.main.nil?
			ingredients = ingredients + self.wednesday.main.ingredients
		end
		if !self.wednesday.dessert.nil?
			ingredients = ingredients + self.wednesday.dessert.ingredients
		end

		# thursday
		if !self.thursday.starter.nil?
			ingredients = ingredients + self.thursday.starter.ingredients
		end
		if !self.thursday.main.nil?
			ingredients = ingredients + self.thursday.main.ingredients
		end
		if !self.thursday.dessert.nil?
			ingredients = ingredients + self.thursday.dessert.ingredients
		end

		# friday
		if !self.friday.starter.nil?
			ingredients = ingredients + self.friday.starter.ingredients
		end
		if !self.friday.main.nil?
			ingredients = ingredients + self.friday.main.ingredients
		end
		if !self.friday.dessert.nil?
			ingredients = ingredients + self.friday.dessert.ingredients
		end

		# saturday
		if !self.saturday.starter.nil?
			ingredients = ingredients + self.saturday.starter.ingredients
		end
		if !self.saturday.main.nil?
			ingredients = ingredients + self.saturday.main.ingredients
		end
		if !self.saturday.dessert.nil?
			ingredients = ingredients + self.saturday.dessert.ingredients
		end

		# sunday
		if !self.sunday.starter.nil?
			ingredients = ingredients + self.sunday.starter.ingredients
		end
		if !self.sunday.main.nil?
			ingredients = ingredients + self.sunday.main.ingredients
		end
		if !self.sunday.dessert.nil?
			ingredients = ingredients + self.sunday.dessert.ingredients
		end

		index = {}
		ingredients.each do |ing|
			if index[ing.food.name].nil?
				index[ing.food.name] = Hash.new
				index[ing.food.name][:quantity] = [0, 0, 0]
				index[ing.food.name][:model] = ing
			end
			if ing.unit == "gramme"
				index[ing.food.name][:quantity][0] = index[ing.food.name][:quantity][0] + ing.quantity.to_i
			end
			if ing.unit == "kilo"
				index[ing.food.name][:quantity][0] = index[ing.food.name][:quantity][0] + (ing.quantity.to_i / 1000)
			end
			if ing.unit == "unit"
				index[ing.food.name][:quantity][1] = index[ing.food.name][:quantity][1] + ing.quantity.to_i
			end
			if ing.unit == "liter"
				index[ing.food.name][:quantity][2] = index[ing.food.name][:quantity][2] + ing.quantity.to_i
			end

		end

		index
	end

	def as_json(options = {})
		json = super(options)
		json['cookbook_name'] = self.cookbook.name
		json['cookbook_recipes_number'] = self.cookbook.recipes_count
		json['author_name'] = self.cookbook.user.name
		json
	end
end
