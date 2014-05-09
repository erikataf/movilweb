class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :comment
      t.references :alert
      t.integer :barrio_id
      t.references :event
      t.integer :user_id

      t.timestamps
    end
    add_index :comments, :alert_id
    add_index :comments, :event_id
  end
end
