class NewOrder < ApplicationRecord
  belongs_to :sauce_name, class_name: "Sauce"
  has_many :sauces, :through => :sauce_orders
end
