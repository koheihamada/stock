class Selling < ApplicationRecord
  belongs_to :user
  belongs_to :item
  belongs_to :buy_price
end
