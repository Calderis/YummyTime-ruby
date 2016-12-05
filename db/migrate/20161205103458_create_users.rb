class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :password
      t.string :mail
      t.string :country
      t.integer :week_id

      t.timestamps
    end
  end
end
