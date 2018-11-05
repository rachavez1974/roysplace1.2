class OrderedItem < ApplicationRecord
  belongs_to :order
  has_many :order
end
