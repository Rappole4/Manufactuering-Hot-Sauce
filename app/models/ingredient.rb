class Ingredient < ApplicationRecord
	has_many :sauces, :through => :factories
	has_many :factories
end
