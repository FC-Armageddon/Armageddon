require 'test_helper'

class ArrivalsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get arrivals_create_url
    assert_response :success
  end

  test "should get index" do
    get arrivals_index_url
    assert_response :success
  end

end
