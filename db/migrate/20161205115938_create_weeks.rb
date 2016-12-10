class CreateWeeks < ActiveRecord::Migration[5.0]
  def change
    create_table :weeks do |t|
      t.integer :cookbook_id

      t.integer :monday_id
      t.integer :tuesday_id
      t.integer :wednesday_id
      t.integer :thursday_id
      t.integer :friday_id
      t.integer :saturday_id
      t.integer :sunday_id
      t.belongs_to :user

      t.timestamps
    end
  end
end
