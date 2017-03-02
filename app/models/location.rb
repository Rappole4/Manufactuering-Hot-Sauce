class Location < ApplicationRecord
	has_many :sauces, foreign_key: :origin_id
	def fullorigin
		"#{self.city}, #{self.state}"
	end
end