class Item < ApplicationRecord
  belongs_to :kind
  belongs_to :color
  belongs_to :size
  has_many :buy_prices
  has_many :sell_prices
  has_many :sold_prices
end
