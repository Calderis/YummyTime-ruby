class CreateRecipes < ActiveRecord::Migration[5.0]
  def change
    create_table :recipes do |t|
      t.integer :persons_amount
      t.text :description
      t.string :name
      t.string :type_menu
      t.integer :count_time
      t.belongs_to :user

      t.timestamps
    end
  end
end
