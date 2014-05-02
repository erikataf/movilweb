class CreateAlerts < ActiveRecord::Migration
  def change
    create_table :alerts do |t|
      t.string :name
      t.text :description
      t.string :place
      t.integer :user_id
      t.integer :barrio_id
      t.integer :comment_id
      t.date :Date
      t.time :Time

      t.timestamps
    end
  end
end
