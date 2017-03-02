class SauceOrders < ActiveRecord::Migration[5.0]
  def change
  	create_table :sauce_orders do |t|
  		t.references :sauce, foreign__key: true
  		t.references :new_order, foreign_key: true

  		t.timestamps
  	end
  end
end
