class CreateNewOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :new_orders do |t|
      t.string :sauce_name
      t.integer :quantity
      t.string :destination

      t.timestamps
    end
  end
end
