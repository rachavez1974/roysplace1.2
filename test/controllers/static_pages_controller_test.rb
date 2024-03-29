require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @base_title = "Roy's Place, a Sandwich Heaven!!"   
  end

  test "should get home" do
    get root_path
    assert_response :success
    assert_select "title", "Home | #{@base_title}"
  end

  test "should get menus" do
    get menus_path
    assert_response :success
    assert_select "title", "Menus | #{@base_title}"
  end

  test "should get contact" do
    get contact_path
    assert_response :success
    assert_select "title", "Contact | #{@base_title}"
  end

  test "should get about" do
    get about_path
    assert_response :success
    assert_select "title", "About | #{@base_title}"
  end

  test "should get offers" do
    get offers_path
    assert_response :success
    assert_select "title", "Offers | #{@base_title}"
  end

  test "should get bagged" do
    get bagged_path 
    assert_response :success
    assert_select "title", "Bagged | #{@base_title}"
  end

end
