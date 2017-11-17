class SellPrice < ApplicationRecord
  validates :sell_price, numericality: { only_integer: true, greater_than_or_equal_to: 50 }
  belongs_to :item, counter_cache: :stock
  belongs_to :user
  has_many :payments


end
