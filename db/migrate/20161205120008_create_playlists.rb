class CreatePlaylists < ActiveRecord::Migration[5.0]
	def change
		create_table :playlists do |t|
			t.integer :persons_amount
			t.text :description
			t.integer :count
			t.belongs_to :author

			t.timestamps
		end
	end
end
