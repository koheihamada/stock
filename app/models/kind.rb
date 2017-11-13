class Kind < ApplicationRecord
  has_many :colors
  has_many :sizes
  has_many :items
  belongs_to :category
  belongs_to :brand

  accepts_nested_attributes_for :items
end
