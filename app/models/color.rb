class Color < ApplicationRecord
  belongs_to :kind
  has_many :items
  accepts_nested_attributes_for :items
end
