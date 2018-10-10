class User < ApplicationRecord
 
 
  has_many :addresses 
  accepts_nested_attributes_for :addresses

  before_save { self.email = email.downcase }


  VAILID_PHONENUMBER_REGEX = /\A\d{10}\z/
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates_associated :addresses
  validates :first_name,   presence: true, length: {maximum: 50} 
  validates :last_name,    presence: true, length: {maximum: 50}
  validates :phone_number, presence: true, length: {maximum: 10},
                           format: {with: VAILID_PHONENUMBER_REGEX} 
  validates :email,        presence: true, length: {maximum: 255},
                           format: {with: VALID_EMAIL_REGEX},
                           uniqueness: {case_sensitive: false}
  validates :terms, presence: true
  has_secure_password
  validates :password,     presence: true, length: {minimum: 1}
  validates :password_confirmation, presence: true, length: {minimum: 1}

  
end
