class CreateFactories < ActiveRecord::Migration[5.0]
  def change
    create_table :factories do |t|
      t.integer :sauce_id
      t.integer :ingredient_id

      t.timestamps
    end
  end
end
