class CreateFollowers < ActiveRecord::Migration[5.0]
	def change
		create_table :followers do |t|
			t.integer :followed_id
			t.integer :follower_id
			t.string :follower_type

			t.timestamps
		end
	end
end
