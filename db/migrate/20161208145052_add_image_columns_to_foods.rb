class AddImageColumnsToFoods < ActiveRecord::Migration
	def up
		add_attachment :foods, :image
	end

	def down
		remove_attachment :foods, :image
	end
end