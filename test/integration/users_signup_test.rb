require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  test "Should not allowed signup with wrong information" do
    get signup_path
    assert_template 'users/new'
    assert_select 'form[action="/signup"]'

    assert_no_difference 'User.count' do
      post users_path, params: { user: {
            first_name: "  ", last_name: 
            "   ", phone_number: 240867333335309,
            email: "razorcut@gmil.con",
            password: "123", password_confirmation: "13", terms: true, address:{
            street_address: " ",
            address_type: " ", unit_type: "Apt",
            number: "301", city: " ", state: "    ", 
            zipcode: 123456788  } } }
    end

    assert_template 'users/new'
    assert_select   "div.alert", "Please review the problems below:"
  end

test "Should allowed signup with correct information" do
  get signup_path
  assert_template 'users/new'
  assert_select 'form[action="/signup"]'

  assert_difference 'User.count', 1 do
    post users_path, params: { user: {
            first_name: "Razor", last_name: 
            "Ramon", phone_number: 2408675309,
            email: "razorcut@gmil.com",
            password: "1", password_confirmation: "1", terms: true, address:{
            street_address: "1332 Bryant ST ",
            address_type: "Residence", unit_type: "Apt",
            number: "301", city: "Rome", state: "Italia", 
            zipcode: 12345  } } }
  end

  follow_redirect!
  assert_template 'users/show'
end

end
