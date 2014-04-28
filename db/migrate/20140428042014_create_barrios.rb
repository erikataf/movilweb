class CreateBarrios < ActiveRecord::Migration
  def change
    create_table :barrios do |t|
      t.string :barrio

      t.timestamps
    end
  end
end
