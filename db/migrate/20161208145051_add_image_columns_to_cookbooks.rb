class AddImageColumnsToCookbooks < ActiveRecord::Migration
	def up
		add_attachment :cookbooks, :image
	end

	def down
		remove_attachment :cookbooks, :image
	end
end