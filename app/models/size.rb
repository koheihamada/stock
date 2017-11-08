class Size < ApplicationRecord
  belongs_to :color
  has_many :items
end
