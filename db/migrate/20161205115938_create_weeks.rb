class CreateWeeks < ActiveRecord::Migration[5.0]
  def change
    create_table :weeks do |t|
      t.integer :cookbook_id

      t.belongs_to :user

      t.timestamps
    end
  end
end
