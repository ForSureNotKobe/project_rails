require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  test "invalid signup information" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, params: { user: {  name: "",
                                          email: "user@valid.pl",
                                          password: "foo",
                                          password_confirmation: "bar" } }
    end    
    assert_template 'users/new'
    assert_select 'div#error_explanation'
    assert_select 'div.alert'
    assert_select 'div.alert-danger'
    assert flash.empty?
  end

  test "valid signup information" do
    assert_difference 'User.count', 1 do
      post users_path, params: { user: {  name: "Test",
                                          email: "user@valid.pl",
                                          password: "foobar",
                                          password_confirmation: "foobar" } }
    end
    follow_redirect!
    assert_template 'companies/new'
    assert_select 'div.alert.alert-success'
    assert_not flash.empty?
    assert is_logged_in?
  end
end
