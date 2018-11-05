require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  def setup
    @item = Item.new(item_name: "La Mañana Burrito", description: "Very delicious",
                     price: 6.99, modifiers: "Any", menu: "Breakfast", section: "Starters",
                     availability: true)
  end

  test "item should be valid" do
    assert @item.valid?      
  end

  test "item name should be present" do
    @item.item_name = ""
    assert_not @item.valid?
  end

  test "item name should not be too long" do
    @item.item_name = "a" * 51
    assert_not @item.valid?
  end

  test "Item's description should be present" do
    @item.description = ""
    assert_not @item.valid?
  end

  test "Item's description should not be too long" do
    @item.description = "a" * 251
    assert_not @item.valid?
  end

  test "Item's price should be present" do
    @item.price = ""
    assert_not @item.valid?
  end

  test "Item's price should be greater than 0" do
    @item.price = 0.0
    assert_not @item.valid?
  end

  test "item's price should only have two decimal places" do
    @item.price = 8.9780
    assert_not @item.valid?
  end

  test "item's should not exceed ten thousands" do
    @item.price = 789088.09
    assert_not @item.valid?
  end

  test "Item's modifiers should be present" do
    @item.modifiers = ""
    assert_not @item.valid?
  end

  test "Item's modifiers should not be too long" do
    @item.modifiers = "a" * 76
    assert_not @item.valid?
  end

  test "Item's menu should be valid" do
    valid_menus = %w[Breakfast Lunch Dinner HappyHour LateNight Brunch Catering]
    valid_menus.each do |menu|
      @item.menu = menu
      assert @item.valid?
    end
  end

  test "Item's section should be valid" do
    valid_sections =  %w[Starters Classics Dishes A_La_Carte Confections]
    @item.section = "Starters"
    assert @item.valid?
  end

  test "Item's availability should be present" do
    @item.availability = nil
    assert_not @item.valid?
  end

end
