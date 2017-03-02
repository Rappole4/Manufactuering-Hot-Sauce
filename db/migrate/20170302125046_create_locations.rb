class CreateLocations < ActiveRecord::Migration[5.0]
  def change
  	create_table :locations do |t|
      t.string :city, limit: 128
      t.string :state, limit: 2

      t.timestamps
    end
  end
end
