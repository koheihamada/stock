class User < ApplicationRecord
  has_many :buy_prices
  has_many :sell_prices
end
