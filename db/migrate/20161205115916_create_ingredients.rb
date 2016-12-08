class CreateIngredients < ActiveRecord::Migration[5.0]
	def change
		create_table :ingredients do |t|
			t.belongs_to :recipe, index: true
			t.integer :food_id
			t.integer :quantity
			t.text :unit

			t.timestamps
		end
	end
end
