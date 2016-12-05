class CreatePlaylists < ActiveRecord::Migration[5.0]
  def change
    create_table :playlists do |t|
      t.string :recipes
      t.integer :persons_amount
      t.text :description
      t.integer :count
      t.integer :author_id

      t.timestamps
    end
  end
end
