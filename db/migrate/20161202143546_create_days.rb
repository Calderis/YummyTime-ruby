class CreateDays < ActiveRecord::Migration[5.0]
  def change
    create_table :days do |t|
      t.integer :starter_id
      t.integer :main_id
      t.integer :dessert_id

      t.timestamps
    end
  end
end
