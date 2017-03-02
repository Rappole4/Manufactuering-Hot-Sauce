class NewOrder < ApplicationRecord
  belongs_to :sauce_name, class_name: "Sauce"
end
