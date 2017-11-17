class BuyPrice < ApplicationRecord
  validates :buy_price, numericality: { only_integer: true, greater_than_or_equal_to: 50 }
  belongs_to :item
  belongs_to :user
end
