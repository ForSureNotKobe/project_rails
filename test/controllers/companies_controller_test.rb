require 'test_helper'

class CompaniesControllerTest < ActionDispatch::IntegrationTest

  test "should get new" do
    get signcompany_path
    assert_response :success
  end

end
