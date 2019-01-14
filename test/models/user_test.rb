require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(name: "Example User", email: "user@example.com")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "name should be present" do
    @user.name = ""
    assert_not @user.valid?
  end

  test "length of name" do
  	@user.name = "ez"
    @user.name.length >= 5
    @user.name.length <= 50
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email = "     "
    assert_not @user.valid?
  end

   test "length of email" do
    @user.email = "ez"
    @user.email.length >= 8
    @user.email.length <= 255
    assert_not @user.valid?
  end

  test "is_a_valid_email" do
  	@user.email = "ez"
    @user.email =~ /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    assert_not @user.valid?
  end

end