require 'test_helper'

class SubcontractorsControllerTest < ActionController::TestCase
  include SessionsHelper

  setup do
    @subcontractor = subcontractors(:one)
	@user = users(:one)
	log_in(@user)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:subcontractors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create subcontractor" do
    assert_difference('Subcontractor.count') do
      post :create, subcontractor: { company_size: @subcontractor.company_size, created_at: @subcontractor.created_at, email: @subcontractor.email + "1", location: @subcontractor.location, name: @subcontractor.name, skills: @subcontractor.skills, description: @subcontractor.description, password: "passpass", link: @subcontractor.link }
    end

    assert_redirected_to subcontractor_path(assigns(:subcontractor))
  end

  test "should preffix link" do
    assert_difference('Subcontractor.count') do
	  old_link = "getqlibri.com"
      post :create, subcontractor: { company_size: @subcontractor.company_size, created_at: @subcontractor.created_at, email: @subcontractor.email + "1", location: @subcontractor.location, name: @subcontractor.name, skills: @subcontractor.skills, description: @subcontractor.description, password: "passpass", link: old_link}
	  new_sub_contractor = Subcontractor.where("email = \"" + @subcontractor.email + "1" + "\"")[0]
	  assert new_sub_contractor.link == "http://" + old_link, "Link not correct. New link is: #{new_sub_contractor.link}"
    end

    assert_redirected_to subcontractor_path(assigns(:subcontractor))
  end

  test "should show subcontractor" do
    get :show, id: @subcontractor
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @subcontractor
    assert_response :success
  end

  test "should update subcontractor" do
    patch :update, id: @subcontractor, subcontractor: { company_size: @subcontractor.company_size, created_at: @subcontractor.created_at, email: @subcontractor.email, location: @subcontractor.location, name: @subcontractor.name, skills: @subcontractor.skills, description: @subcontractor.description, password: "passpass", link: @subcontractor.link}
    assert_redirected_to subcontractor_path(assigns(:subcontractor))
  end

  test "should destroy subcontractor" do
    assert_difference('Subcontractor.count', -1) do
	  @user.subcontractor = @subcontractor
      delete :destroy, id: @subcontractor
    end

    assert_redirected_to subcontractors_path
  end
end
