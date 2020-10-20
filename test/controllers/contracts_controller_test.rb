require 'test_helper'

class ContractsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get contracts_index_url
    assert_response :success
  end

  test "should get search" do
    get contracts_search_url
    assert_response :success
  end

end
