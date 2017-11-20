class SoldPriceForSell < ApplicationRecord
  belongs_to :item
  belongs_to :payment
end
