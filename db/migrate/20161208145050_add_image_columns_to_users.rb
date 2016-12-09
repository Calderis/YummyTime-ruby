class AddImageColumnsToUsers < ActiveRecord::Migration
	# def up
	# 	add_attachment :users, :image
	# end

	# def down
	# 	remove_attachment :users, :image
	# end

	def self.up
    change_table :users do |t|
    	t.attachment :image
    end
  end

  def self.down
  	drop_attached_file :users, :image
  end
end