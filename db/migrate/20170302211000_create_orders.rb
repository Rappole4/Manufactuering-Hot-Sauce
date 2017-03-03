class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.string :sauce_id
      t.integer :quantity
      t.string :destination

      t.timestamps
    end
  end
end
