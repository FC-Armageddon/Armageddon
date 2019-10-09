require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get update" do
    get users_update_url
    assert_response :success
  end

  test "should get show" do
    get users_show_url
    assert_response :success
  end

  test "should get edit" do
    get users_edit_url
    assert_response :success
  end

  test "should get deleted_flag" do
    get users_deleted_flag_url
    assert_response :success
  end

  test "should get admins_index" do
    get users_admins_index_url
    assert_response :success
  end

  test "should get admins_show" do
    get users_admins_show_url
    assert_response :success
  end

  test "should get admins_edit" do
    get users_admins_edit_url
    assert_response :success
  end

  test "should get admins_update" do
    get users_admins_update_url
    assert_response :success
  end

  test "should get admins_deleted_flag" do
    get users_admins_deleted_flag_url
    assert_response :success
  end

end
