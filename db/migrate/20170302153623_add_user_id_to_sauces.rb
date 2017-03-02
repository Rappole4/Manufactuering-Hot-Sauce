class AddUserIdToSauces < ActiveRecord::Migration[5.0]
  def change
    add_reference :sauces, :user, foreign_key: true
  end
end
