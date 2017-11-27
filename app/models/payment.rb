class Payment < ApplicationRecord
  belongs_to :user
  belongs_to :item
  belongs_to :sell_price
  has_many :sold_price_for_sells

  # after_createを使ってコントローラーの作業を減らしたい。。

end
