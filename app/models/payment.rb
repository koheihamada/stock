class Payment < ApplicationRecord
  belongs_to :user
  belongs_to :item
  belongs_to :sell_price
  has_many :sold_prices
end
