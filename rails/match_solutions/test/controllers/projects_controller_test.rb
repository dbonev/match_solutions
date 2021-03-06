require 'test_helper'

class ProjectsControllerTest < ActionController::TestCase
  include SessionsHelper

  setup do
    @project = projects(:one)
	@user = users(:one)
  	log_in(@user)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:projects)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create project" do
    assert_difference('Project.count') do
      post :create, project: { created_at: @project.created_at, description: @project.description, email: @project.email, location: @project.location, name: @project.name }
    end

    #assert_redirected_to project_path(assigns(:project))
  end

  test "should show project" do
    get :show, id: @project
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @project
    assert_response :success
  end

  test "should update project" do
    patch :update, id: @project, project: { created_at: @project.created_at, description: @project.description, email: @project.email, location: @project.location, name: @project.name }
    assert_redirected_to project_path(assigns(:project))
  end

  test "should destroy project" do
    assert_difference('Project.count', -1) do
      @project.user = @user
      delete :destroy, id: @project
    end

    assert_redirected_to projects_path
  end
end
