class Day < ApplicationRecord

	# starter - starter recipe
	# main - main recipe
	# dessert - dessert recipe

	def starter
		if self.starter_id.nil?
			nil
		else
			Recipe.find(self.starter_id)
		end
	end
	def main
		if self.main_id.nil?
			nil
		else
			Recipe.find(self.main_id)
		end
	end
	def dessert
		if self.dessert_id.nil?
			nil
		else
			Recipe.find(self.dessert_id)
		end
	end
end