class SoldPriceForBuy < ApplicationRecord
  belongs_to :item
  belongs_to :selling

end
