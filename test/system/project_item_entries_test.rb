require "application_system_test_case"

class ProjectItemEntriesTest < ApplicationSystemTestCase
  setup do
    @project_item_entry = project_item_entries(:one)
  end

  test "visiting the index" do
    visit project_item_entries_url
    assert_selector "h1", text: "Project Item Entries"
  end

  test "creating a Project item entry" do
    visit project_item_entries_url
    click_on "New Project Item Entry"

    fill_in "Amount", with: @project_item_entry.amount
    fill_in "Fiscal year", with: @project_item_entry.fiscal_year_id
    fill_in "Item register page no", with: @project_item_entry.item_register_page_no
    fill_in "Office", with: @project_item_entry.office_id
    fill_in "Project entry item", with: @project_item_entry.project_entry_item_id
    fill_in "Project", with: @project_item_entry.project_id
    fill_in "Project item", with: @project_item_entry.project_item_id
    fill_in "Project wise item register page no", with: @project_item_entry.project_wise_item_register_page_no
    fill_in "Quantity", with: @project_item_entry.quantity
    fill_in "Rate", with: @project_item_entry.rate
    fill_in "Released to", with: @project_item_entry.released_to
    fill_in "User", with: @project_item_entry.user_id
    click_on "Create Project item entry"

    assert_text "Project item entry was successfully created"
    click_on "Back"
  end

  test "updating a Project item entry" do
    visit project_item_entries_url
    click_on "Edit", match: :first

    fill_in "Amount", with: @project_item_entry.amount
    fill_in "Fiscal year", with: @project_item_entry.fiscal_year_id
    fill_in "Item register page no", with: @project_item_entry.item_register_page_no
    fill_in "Office", with: @project_item_entry.office_id
    fill_in "Project entry item", with: @project_item_entry.project_entry_item_id
    fill_in "Project", with: @project_item_entry.project_id
    fill_in "Project item", with: @project_item_entry.project_item_id
    fill_in "Project wise item register page no", with: @project_item_entry.project_wise_item_register_page_no
    fill_in "Quantity", with: @project_item_entry.quantity
    fill_in "Rate", with: @project_item_entry.rate
    fill_in "Released to", with: @project_item_entry.released_to
    fill_in "User", with: @project_item_entry.user_id
    click_on "Update Project item entry"

    assert_text "Project item entry was successfully updated"
    click_on "Back"
  end

  test "destroying a Project item entry" do
    visit project_item_entries_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Project item entry was successfully destroyed"
  end
end
