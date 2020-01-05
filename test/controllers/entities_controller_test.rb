require 'test_helper'

class EntitiesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get entities_new_url
    assert_response :success
  end

  test "should get create" do
    get entities_create_url
    assert_response :success
  end

  test "should get edit" do
    get entities_edit_url
    assert_response :success
  end

  test "should get update" do
    get entities_update_url
    assert_response :success
  end

end
