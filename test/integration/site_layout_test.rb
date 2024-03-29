require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
    test "layout links" do
      get root_path
      assert_template 'static_pages/home'
      assert_select "a[href=?]", root_path, count: 2
      assert_select  "a[href=?]", about_path
      assert_select  "a[href=?]", menus_path
      assert_select  "a[href=?]", bagged_path
      assert_select  "a[href=?]", offers_path
      assert_select  "a[href=?]", contact_path
      assert_select  "a[href=?]", signup_path

      get root_path
      assert_select "title", full_title("Home")
      get signup_path
      assert_template 'users/new'
      assert_select "title", full_title("Sign up")
      
  end
end
