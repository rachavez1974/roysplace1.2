require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:nemo)
    @another_user = users(:razor)
  end

  test "should get new" do
    get signup_path
    assert_response :success
  end

  test "should redirect edit when not logged in" do
    get edit_user_path(@user)
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect update when not logged in" do
    patch user_path(@user), params: { user: { first_name: @user.first_name,
                                              email: @user.email } }
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  # test "should redirect edit when logged in as wrong user" do
  #   log_in_as(@another_user)
  #   post login_path, params: { session: { email:    @user.email,
  #                                         password: 'password' } } 
  #   get edit_user_path(@user)
  #   assert flash.empty?
  #   assert_redirected_to root_url
  # end

  # test "should redirect update when logged in as wrong user" do
  #   log_in_as(@another_user)
  #   patch user_path(@user), params: { user: { first_name: @user.first_name,
  #                                             email: @user.email } }
  #   assert flash.empty?
  #   assert_redirected_to root_url
  # end


end

