require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  test "full title helper" do
    assert_equal full_title, "Roy's Place, a Sandwich Heaven!!"
    assert_equal full_title("Home"), "Home | Roy's Place, a Sandwich Heaven!!"
  end
end