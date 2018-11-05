require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:nemo)
  end

  test "unsuccesful edits" do
    log_in_as(@user)
    get edit_user_path(@user)
    assert_template 'users/edit'
    patch user_path(@user), params: { user: {name: "",
                                             email: "foo@invalid.xxx",
                                             password: " ",
                                             password_confirmation: "qwe"  }}
                                          

    assert_select   "div.alert", "Please review the problems below:"
    assert_template 'users/edit'    
  end

  # test "successful edit" do
  #   log_in_as(@user)
  #   get edit_user_path(@user)
  #   assert_template 'users/edit'
  #   patch user_path(@user), params: { user: {
  #                               first_name: "Razor", last_name: 
  #                               "Ramon", phone_number: 2408675309,
  #                               email: "razorcut@gmail.com",
  #                               password: "password",
  #                               password_confirmation: "password", terms: true, address:{
  #                               street_address: "1332 Bryant ST ",
  #                               address_type: "Residence", unit_type: "Apt",
  #                               number: "301", city: "Rome", state: "Italia", 
  #                               zipcode: 12345  } } } 

  #   assert flash.empty?
  #   assert_redirected_to @user
  #   @user.reload
  #   assert_equal "Razor", @user.first_name
  #   assert_equal "razorcut@gmail.com", @user.email
  # end
end
