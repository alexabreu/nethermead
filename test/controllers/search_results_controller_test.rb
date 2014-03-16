require 'test_helper'

class SearchResultsControllerTest < ActionController::TestCase
  test "should get show" do
    get :show, id: 1
    assert_response :success
  end

end
