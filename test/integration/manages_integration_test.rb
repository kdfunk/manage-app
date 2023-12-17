

require 'application_system_test_case'

class ManagesIntegrationTest < ApplicationSystemTestCase
  setup do
    
  end

  test 'visiting the index' do
    visit manages_url

    assert_selector 'h1', text: 'Listing manages'
  end

  test 'creating a Manage' do
    visit new_manage_url

    fill_in 'Name', with: 'Test Manage'

    click_on 'Create Manage'

    assert_text 'Manage was successfully created'
    assert_selector 'h1', text: 'Test Manage'
  end

  test 'updating a Manage' do

    manage = manages(:one)

    visit edit_manage_url(manage)

    fill_in 'Name', with: 'Updated Manage'

    click_on 'Update Manage'

    assert_text 'Manage was successfully updated'
    assert_selector 'h1', text: 'Updated Manage'
  end

  test 'destroying a Manage' do
    
    manage = manages(:one)

    visit manages_url

    accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Manage was successfully destroyed'
    assert_no_selector 'h1', text: manage.name
  end
end
