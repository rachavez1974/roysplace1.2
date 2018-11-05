class Order < ApplicationRecord
  belongs_to :user
  has_one :user
  has_many :ordered_item
end
