require 'test_helper'

class CdsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get cds_index_url
    assert_response :success
  end

  test "should get search" do
    get cds_search_url
    assert_response :success
  end

  test "should get show" do
    get cds_show_url
    assert_response :success
  end

  test "should get admins_index" do
    get cds_admins_index_url
    assert_response :success
  end

  test "should get admins_show" do
    get cds_admins_show_url
    assert_response :success
  end

  test "should get admins_edit" do
    get cds_admins_edit_url
    assert_response :success
  end

  test "should get admins_update" do
    get cds_admins_update_url
    assert_response :success
  end

  test "should get admins_destroy" do
    get cds_admins_destroy_url
    assert_response :success
  end

  test "should get admins_create" do
    get cds_admins_create_url
    assert_response :success
  end

  test "should get admins_new" do
    get cds_admins_new_url
    assert_response :success
  end

  test "should get admins_search" do
    get cds_admins_search_url
    assert_response :success
  end

end
