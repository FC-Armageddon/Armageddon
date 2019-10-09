require 'test_helper'

class BuyInformationsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get buy_informations_create_url
    assert_response :success
  end

  test "should get updates" do
    get buy_informations_updates_url
    assert_response :success
  end

end
