require 'test_helper'

class CompanyTest < ActiveSupport::TestCase
 
  def setup
    @user = users(:michael)
    @company = Company.new(name: "TestCompany", addres: "Warsaw", nip: "1234567890", user_id: @user.id)
  end

  test "should be valid" do
    assert @company.valid?
  end

  test "user id should be present" do
    @company.user_id = nil
    assert_not @company.valid?
  end

  test "company name should be present" do
    assert_not @company.name.empty?
  end

  test "company addres should be present" do
    assert_not @company.addres.empty?
  end

  test "company nip should be present" do
    assert_not @company.nip.nil?
  end

end
