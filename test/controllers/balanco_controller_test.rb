require 'test_helper'

class BalancoControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get balanco_new_url
    assert_response :success
  end

end
