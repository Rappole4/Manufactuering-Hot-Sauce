class CreateSauces < ActiveRecord::Migration[5.0]
  def change
    create_table :sauces do |t|
      t.string :name
      t.string :description
      t.string :origin
      t.text :ingredients

      t.timestamps
    end
  end
end
