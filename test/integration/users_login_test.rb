require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:companier)
    @user_wo = users(:michael)
  end

  test "login with invalid information" do
    get login_path
    assert_template 'sessions/new'
    post login_path, params: { session: { email: "user@valid.pl", password: "foobar" } }

    assert_not is_logged_in?
    assert_template 'sessions/new'
    assert_not flash.empty?
    get root_path
    assert_template 'static_pages/home'
    assert flash.empty?
  end

  test "login with valid information" do 
    get login_path
    post login_path, params: { session: { email: @user.email,
                                          password: 'password' } }
    assert_redirected_to @user
    follow_redirect!
    assert_template 'users/show'
    assert_select "a[href=?]", login_path, count: 0
    assert_select "a[href=?]", logout_path
    assert_select "a[href=?]", user_path(@user)
  end

  test "login with valid information without company" do 
    get login_path
    post login_path, params: { session: { email: @user_wo.email,
                                          password: 'password' } }
    assert_redirected_to signcompany_path
    follow_redirect!
    assert_template 'companies/new'
    assert_select "a[href=?]", login_path, count: 0
    assert_select "a[href=?]", logout_path
    assert_select "a[href=?]", user_path(@user_wo)
  end


end
