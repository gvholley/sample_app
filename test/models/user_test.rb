require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: "Example User", email: "example@user.com",
      password: "foobar", password_confirmation: "foobar")

  end

  test "name should not be too long" do
    @user.name = "a" * 51
    assert_not @user.valid?


  test "should be valid" do
    assert @user.valid?
  end

  test "name should be present" do
    @user.name = " "
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email = " "
    assert_not @user.valid?
  end

  test "authenticated? should return false for a user with nil digest" do
      assert_not @User.authenticated?('')
  end

end

end

