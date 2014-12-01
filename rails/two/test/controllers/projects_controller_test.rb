require 'test_helper'

class ProjectsControllerTest < ActionController::TestCase
  setup do
    @project = projects(:one)
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
      post :create, project: { description: @project.description, title: @project.title, place: @project.place, allow_remote: @project.allow_remote  }
	  new_project = Project.all.last
	  assert "Timestamp differs", new_project.created_at != Time.now

    end

    assert_redirected_to project_path(assigns(:project))
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
    patch :update, id: @project, project: { description: @project.description, title: @project.title }
    assert_redirected_to project_path(assigns(:project))
  end

  test "should destroy project" do
    assert_difference('Project.count', -1) do
      delete :destroy, id: @project
    end

    assert_redirected_to projects_path
  end
  test "should get search" do
    search_term = "Test"
    get :search, :q => search_term
    assert_response :success
	assert assigns(:projects).count > 0, "We should have found something in search by #{search_term}"
	assert assigns(:search_term) == search_term, "Didn't assign search term properly"
	#assert assigns(:notice).count > 0
  end
end
