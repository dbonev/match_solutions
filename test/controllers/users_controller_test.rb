require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  include SessionsHelper
  setup do
    @user = users(:one)
	log_in(@user)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

#  test "user_authenticate" do
#  	user = User.find_by(:email => "dimitar.bonev@gmail.com")
#	assert user != nil, "User should exist"
#	assert user.authenticate("passpass"), "User should authenticate"
#  end

  test "should create user" do
    assert_difference('User.count') do
      post :create, user: { created_at: @user.created_at, email: @user.email + ".co", password: "passpass" }
    end

    assert_redirected_to user_path(assigns(:user))
  end

  test "should show user" do
    get :show, id: @user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user
    assert_response :success
  end

  test "should update user" do
    patch :update, id: @user, user: { created_at: @user.created_at, email: @user.email, password: "passpass" }
    assert_redirected_to user_path(assigns(:user))
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, id: @user
    end

    assert_redirected_to users_path
  end
end
