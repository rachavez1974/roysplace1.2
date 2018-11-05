class Item < ApplicationRecord
  before_save { self.item_name = item_name.capitalize }
  before_save { self.description = description.capitalize }
  before_save { self.modifiers = modifiers.capitalize }

      
  enum menu: [:Breakfast, :Lunch, :HappyHour, :Dinner, :LateNight, :Brunch, :Catering]
  enum section: [:Starters, :Classics, :Dishes, :A_La_Carte, :Confections]

  VALID_PRICE_REGEX = /^\d{1,4}(\.\d{0,2})?$/

  validates :item_name,    presence: true, length: { maximum: 50 }  
  validates :description,  presence: true, length: { maximum: 250 }
  validates :price,        presence: true, numericality: { greater_than: 0.0},
                           format: { with: VALID_PRICE_REGEX, multiline: true }
  validates :modifiers,    presence: true, length: { maximum: 75 }
  validates :menu,         presence: true, if: :type_of_menu?
  validates :section,      presence: true
  validates :availability, presence: true                   

  #returns true if menu includes one of the enum above
  def type_of_menu?
    menu.include?(menu)
  end


end

