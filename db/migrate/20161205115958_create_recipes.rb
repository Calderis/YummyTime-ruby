class CreateRecipes < ActiveRecord::Migration[5.0]
  def change
    create_table :recipes do |t|
      t.integer :persons_amount
      t.text :description
      t.string :image
      t.string :type_menu
      t.integer :count
      t.integer :author_id

      t.timestamps
    end
  end
end
