class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :Name
      t.text :Description
      t.string :Place
      t.integer :user_id
      t.integer :barrio_id
      t.date :Date
      t.time :Time

      t.timestamps
    end
  end
end
