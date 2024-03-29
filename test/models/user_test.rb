require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(first_name: "Razor", last_name: 
            "Ramon", phone_number: "2408675309",
            birth_day: Date.parse('January, 8'), email: "razorcut@gamil.com",
            password: "123", password_confirmation: "123", 
            text_club: true, email_club: true, terms: true, admin: false)
    
  end

  test "user should be valid" do
    assert @user.valid?    
  end

  test "first name should be present" do
    @user.first_name = ""
    assert_not @user.valid?
  end

  test "first name should not be too long" do
    @user.first_name = "a" * 51
    assert_not @user.valid?
  end

  test "last name should be present" do
    @user.last_name = ""
    assert_not @user.valid?
  end

  test "last name should not be too long" do
    @user.last_name = "a" * 51
    assert_not @user.valid?
  end

  test "phone number shold be present" do
    @user.phone_number = ""
    assert_not @user.valid?
  end

  test "phone number should not be more than 10 numbers" do
    @user.phone_number = rand(1e9...1e11).to_i
    assert_not @user.valid?
  end

  test "email should be preesnt" do
    @user.email = ""
    assert_not @user.valid?
  end

  test "email should not be too long" do
    @user.email = "a" * 244 + "@example.com"
    assert_not @user.valid?
  end

  test "email validation should accept valid email addresses" do 
    valid_email_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    
    valid_email_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"      
    end
  end

  test "email validation should reject invalid email addresses" do
    invalid_email_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]

      invalid_email_addresses.each do |invalid_address|
        @user.email = invalid_address
        assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
      end
  end

  test "email addresses should be unique" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

  test "email should be saved as lower case" do
    mix_case_email = "fO0@example.COM"
    @user.email = mix_case_email
    @user.save
    assert_equal mix_case_email.downcase!, @user.reload.email
  end

  test "password should be present (nonblank)" do
    @user.password = @user.password_confirmation = " " * 3
    assert_not @user.valid?
  end

  test "password shoul be at least 1 characters" do
    @user.password = @user.password_confirmation = "a" * 0
    assert_not @user.valid?     
  end

  test "Terms should be present" do
    @user.terms = nil
    assert_not @user.valid?
  end

  test "authenticated? should return false for a user with nil digest" do
    assert_not @user.authenticated?('')
  end

end
