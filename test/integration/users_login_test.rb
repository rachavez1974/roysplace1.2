require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:nemo)
  end


  test "Login with wrong information regular customer" do
    get user_login_path
    assert_template 'sessions/new_user'
    post user_login_path, params: {session: {email: "", password: ""}}
    assert_template 'sessions/new_user'
    assert_not flash.empty?
    assert_select "div.alert", "Invalid email/password combination"
    get root_path
    assert flash.empty? 
  end

  test "Login with right information followed by logout" do
    get user_login_path
    assert_template 'sessions/new_user'
    post user_login_path, params: {session: {email: @user.email,
                                        password: 'password'}}

    assert is_logged_in?
    assert_redirected_to @user
    follow_redirect!
    assert_template 'users/show'
    assert_select "a[href=?]", user_login_path, count: 0
    assert_select "a[href=?]", user_path(@user)
    assert_select "a[href=?]", logout_path
    delete logout_path
    assert_not is_logged_in?
    assert_redirected_to root_url
    # Simulate a user clicking logout in a second window.
    delete logout_path
    follow_redirect!
    assert_select "a[href=?]", user_login_path
    assert_select "a[href=?]", logout_path, count: 0
    assert_select "a[href=?]", user_path(@user), count: 0

  end

  test "login with remembering" do
    log_in_as(@user, remember_me: '1')
    assert_equal cookies['remember_token'], assigns(:user).remember_token
  end

  test "login without remembering" do
    # Log in to set the cookie.
    log_in_as(@user, remember_me: '1')
    # Log in again and verify that the cookie is deleted.
    log_in_as(@user, remember_me: '0')
    assert_empty cookies['remember_token']
  end
end
