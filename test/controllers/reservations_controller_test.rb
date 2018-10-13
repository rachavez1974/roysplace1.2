require 'test_helper'

class ReservationsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get newreservation_path
    assert_response :success
  end

end
