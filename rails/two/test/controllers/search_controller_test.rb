require 'test_helper'

class SearchControllerTest < ActionController::TestCase
  test "should get get" do
    search_term = "Test"
    get :get, :q => search_term
    assert_response :success
	assert assigns(:projects).count > 0, "We should have found something in search by #{search_term}"
	assert assigns(:search_term) == search_term, "Didn't assign search term properly"
  end

end
