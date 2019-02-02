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

  test "login with valid information followed by logout" do
    get login_path
    post login_path, params: { session: { email:    @user.email,
                                          password: 'password' } }
    assert is_logged_in?
    assert_redirected_to @user
    follow_redirect! #to check the right redirect target and
    assert_template 'users/show' #to actually visit the target page
    assert_select "a[href=?]", login_path, count: 0 #mean 0 login link on the page
    assert_select "a[href=?]", logout_path #logout link is exist
    assert_select "a[href=?]", user_path(@user) #user_path link exist
    delete logout_path #logout
    assert_not is_logged_in? #not loged in anymore?
    assert_redirected_to root_url #redirect to root
    # Simulate a user clicking logout in a second window.
    delete logout_path
    follow_redirect! #to check the right redirect target and
    assert_select "a[href=?]", login_path #login link exist
    assert_select "a[href=?]", logout_path,      count: 0 #logout link not exist
    assert_select "a[href=?]", user_path(@user), count: 0 #user_path link not exist
  end

  test "login with remembering" do
    log_in_as(@user, remember_me: '1')
    assert_not_empty cookies['remember_token']
  end

  test "login without remembering" do
    # Log in to set the cookie.
    log_in_as(@user, remember_me: '1')
    # Log in again and verify that the cookie is deleted.
    log_in_as(@user, remember_me: '0')
    assert_empty cookies['remember_token']
  end
end
