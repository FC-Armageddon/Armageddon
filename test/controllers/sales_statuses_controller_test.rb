require 'test_helper'

class SalesStatusesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get sales_statuses_create_url
    assert_response :success
  end

  test "should get update" do
    get sales_statuses_update_url
    assert_response :success
  end

end
