require "application_system_test_case"

class ManagesTest < ApplicationSystemTestCase
  setup do
    @manage = manages(:one)
  end

  test "visiting the index" do
    visit manages_url
    assert_selector "h1", text: "Manages"
  end

  test "should create manage" do
    visit manages_url
    click_on "New manage"

    fill_in "Description", with: @manage.description
    fill_in "Name", with: @manage.name
    fill_in "User", with: @manage.user_id
    click_on "Create Manage"

    assert_text "Manage was successfully created"
    click_on "Back"
  end

  test "should update Manage" do
    visit manage_url(@manage)
    click_on "Edit this manage", match: :first

    fill_in "Description", with: @manage.description
    fill_in "Name", with: @manage.name
    fill_in "User", with: @manage.user_id
    click_on "Update Manage"

    assert_text "Manage was successfully updated"
    click_on "Back"
  end

  test "should destroy Manage" do
    visit manage_url(@manage)
    click_on "Destroy this manage", match: :first

    assert_text "Manage was successfully destroyed"
  end
end
