class Sauce < ApplicationRecord
  validates :image, presence: true
  belongs_to :origin, class_name:"Location"
  validates :image, :user_id, presence: true
  belongs_to :user
  has_attached_file :image, styles: { :small => "300x" }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  has_many :new_orders, :through => :sauce_orders
end
