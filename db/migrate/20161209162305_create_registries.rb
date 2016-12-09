class CreateRegistries < ActiveRecord::Migration[5.0]
	def change
		create_table :registries do |t|
			t.belongs_to :cookbook, index: true
			t.belongs_to :recipe, index: true

			t.timestamps
		end
	end
end
