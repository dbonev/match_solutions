require 'test_helper'

class TechscreeningControllerTest < ActionController::TestCase
  test "should get hr" do
    get :hr
    assert_response :success
  end

  test "should get companies" do
    get :companies
    assert_response :success
  end

  test "should get professionals" do
    get :professionals
    assert_response :success
  end

end
