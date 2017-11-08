class Color < ApplicationRecord
  belongs_to :kind
  has_many :sizes
  has_many :images
  has_many :items
end
