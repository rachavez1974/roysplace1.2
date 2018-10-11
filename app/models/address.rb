class Address < ApplicationRecord
  belongs_to :user
  has_many :users
  
  
  validates  :street_address, presence: true, length: {maximum: 150}
  validates  :address_type, presence: true
  validates  :unit_type, presence: true
  validates  :number, presence: true, if: :type_of_unit? 
  validates  :city, presence: true, length: {in: 2..50}
  validates  :state, presence: true, length: {in: 2..50}
  validates  :zipcode, presence: true, length: {maximum: 5}

  def type_of_unit?
    "Apt, Floor, Suite".split(",").include?(unit_type)
  end
  
end
