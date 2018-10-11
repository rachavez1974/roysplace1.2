require 'test_helper'

class AddressTest < ActiveSupport::TestCase
  def setup
    @user = users(:nemo)
    @address = @user.addresses.build(street_address: "1332 Rays ave NE", address_type: "Residence", unit_type: "Apt",
                           number: "301", city: "Roma", state: "Maryland", zipcode: 47573, user_id: @user.id)
      
  end

  test "addres should be valid" do
    assert @address.valid?
  end

  test "street address should be present" do
    @address.street_address = "         "
    assert_not @address.valid?    
  end

  test "stree address should not be longer than 150 characters" do
    @address.street_address = "a" * 151
    assert_not @address.valid?
  end

  test "Address type should be present" do
    @address.address_type = "     "
    assert_not @address.valid?
  end

  test "Unit type should be present" do
    @address.unit_type = "     "
    assert_not @address.valid?
  end

  test "City should be present" do
    @address.city = "    "
    assert_not @address.valid?
  end

  test "city should not be more than 50 characters" do
    @address.city = "a" * 51
    assert_not @address.valid?  
  end

  test "State should be present" do
    @address.state = "     "
    assert_not @address.valid?
  end

  test "State should not be more than 50 characters" do
    @address.state = "a" * 51
    assert_not @address.valid?
  end

  test "Zipcode should be present" do
    @address.zipcode = "     "
    assert_not @address.valid?
  end

  test "zipcode should not be more than 5 characters" do
    @address.zipcode = rand(1e4...1e6).to_i
    puts @address.zipcode
    assert_not @address.valid?
  end
end
