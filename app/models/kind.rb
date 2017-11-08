class Kind < ApplicationRecord
  has_many :colors
  has_many :items
  belongs_to :category
  belongs_to :brand
end
