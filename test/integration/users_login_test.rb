require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:michael)
  end


  test "login with invalid information" do
    get login_path #get requiest
    assert_template 'sessions/new'  #check for session/new is prpoerly loading up
    post login_path, params: { session: { email: "", password: "" } } #check the login with failed details
    assert_template 'sessions/new'  #check for session/new is prpoerly loading up, as the login was failed
    assert_not flash.empty? #ensure the flash is not empty
    get root_path #get requiest for root_path
    assert flash.empty? #ensure the flash is empty (passed away). witn "new" method on the flash
  end

  test "login with valid information" do
    get login_path
    post login_path, params: { session: { email:    @user.email,
                                          password: 'password' } }
    assert_redirected_to @user
    follow_redirect! #to check the right redirect target and
    assert_template 'users/show' #to actually visit the target page
    assert_select "a[href=?]", login_path, count: 0 #mean 0 login link on the page
    assert_select "a[href=?]", logout_path #logout link is exist
    assert_select "a[href=?]", user_path(@user) #user_path link exist
  end
end
