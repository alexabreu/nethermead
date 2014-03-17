require 'test_helper'

class CompanyControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should return a list of search results for markets" do
    get :markets, id: 1, format: :json
    @results = ActiveSupport::JSON.decode @response.body
    assert_response :success
    assert_not_equal @results.length, 0
  end

  test "market information should include state and product class" do
    get :markets, id: 1, format: :json
    @results = ActiveSupport::JSON.decode @response.body
    assert @results[0].key? 'state'
    assert @results[0].key? 'product_class'
  end

end
