require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  test "login with invalid information" do
    get login_path #get requiest
    assert_template 'sessions/new'  #check for session/new is prpoerly loading up
    post login_path, params: { session: { email: "", password: "" } } #check the login with failed details
    assert_template 'sessions/new'  #check for session/new is prpoerly loading up, as the login was failed
    assert_not flash.empty? #ensure the flash is not empty
    get root_path #get requiest for root_path
    assert flash.empty? #ensure the flash is empty (passed away). witn "new" method on the flash
  end
end
