require "test_helper"

class ManagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @manage = manages(:one)
  end

  test "should get index" do
    get manages_url
    assert_response :success
  end

  test "should get new" do
    get new_manage_url
    assert_response :success
  end

  test "should create manage" do
    assert_difference("Manage.count") do
      post manages_url, params: { manage: { description: @manage.description, name: @manage.name, user_id: @manage.user_id } }
    end

    assert_redirected_to manage_url(Manage.last)
  end

  test "should show manage" do
    get manage_url(@manage)
    assert_response :success
  end

  test "should get edit" do
    get edit_manage_url(@manage)
    assert_response :success
  end

  test "should update manage" do
    patch manage_url(@manage), params: { manage: { description: @manage.description, name: @manage.name, user_id: @manage.user_id } }
    assert_redirected_to manage_url(@manage)
  end

  test "should destroy manage" do
    assert_difference("Manage.count", -1) do
      delete manage_url(@manage)
    end

    assert_redirected_to manages_url
  end
end
