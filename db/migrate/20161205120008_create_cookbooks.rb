class CreateCookbooks < ActiveRecord::Migration[5.0]
	def change
		create_table :cookbooks do |t|
			t.integer :persons_amount
			t.string :name
			t.text :description
			t.integer :count_time
			t.belongs_to :user

			t.timestamps
		end
	end
end
