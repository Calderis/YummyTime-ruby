require 'test_helper'

class DiscoverControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get discover_index_url
    assert_response :success
  end

end
