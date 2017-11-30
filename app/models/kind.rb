class Kind < ApplicationRecord
  has_many :colors
  has_many :sizes
  has_many :items
  has_many :images

  accepts_nested_attributes_for :items
end
