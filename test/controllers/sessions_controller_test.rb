require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @base_title = "Roy's Place, a Sandwich Heaven!!"   
  end

  test "should get new_user" do
    get user_login_path
    assert_response :success
    assert_select "title", "Login User | #{@base_title}"
  end

  test "should get new_admin" do
    get admin_login_path
    assert_response :success
    assert_select "title", "Login Admin | #{@base_title}"
  end


end
