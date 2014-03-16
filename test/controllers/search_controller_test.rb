require 'test_helper'

class SearchControllerTest < ActionController::TestCase
  test "should search company names" do
    get :companies, company_name: 'MyString', format: :json
    results = ActiveSupport::JSON.decode @response.body
    assert_not_equal results.length, 0
  end
end
