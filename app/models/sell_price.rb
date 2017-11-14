class SellPrice < ApplicationRecord
  belongs_to :item
  belongs_to :user
  has_many :payments
end
