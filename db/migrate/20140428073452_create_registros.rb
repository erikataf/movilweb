class CreateRegistros < ActiveRecord::Migration
  def change
    create_table :registros do |t|
      t.string :name
      t.string :last_name

      t.timestamps
    end
  end
end
