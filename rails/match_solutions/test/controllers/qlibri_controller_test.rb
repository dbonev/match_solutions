require 'test_helper'

class QlibriControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get portfolio" do
    get :portfolio
    assert_response :success
  end

  test "should get contacts" do
    get :contacts
    assert_response :success
  end

end
