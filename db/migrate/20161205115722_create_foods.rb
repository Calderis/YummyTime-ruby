class CreateFoods < ActiveRecord::Migration[5.0]
	def change
		create_table :foods do |t|
			
			t.string :name
			t.integer :count

			t.timestamps
		end
	end
end
