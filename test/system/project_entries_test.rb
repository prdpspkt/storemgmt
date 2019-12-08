require "application_system_test_case"

class ProjectEntriesTest < ApplicationSystemTestCase
  setup do
    @project_entry = project_entries(:one)
  end

  test "visiting the index" do
    visit project_entries_url
    assert_selector "h1", text: "Project Entries"
  end

  test "creating a Project entry" do
    visit project_entries_url
    click_on "New Project Entry"

    fill_in "Amount", with: @project_entry.amount
    fill_in "Fiscal year", with: @project_entry.fiscal_year_id
    fill_in "Item register page no", with: @project_entry.item_register_page_no
    fill_in "Office", with: @project_entry.office_id
    fill_in "Project entry item", with: @project_entry.project_entry_item_id
    fill_in "Quantity", with: @project_entry.quantity
    fill_in "Rate", with: @project_entry.rate
    fill_in "Released to", with: @project_entry.released_to
    fill_in "User", with: @project_entry.user_id
    click_on "Create Project entry"

    assert_text "Project entry was successfully created"
    click_on "Back"
  end

  test "updating a Project entry" do
    visit project_entries_url
    click_on "Edit", match: :first

    fill_in "Amount", with: @project_entry.amount
    fill_in "Fiscal year", with: @project_entry.fiscal_year_id
    fill_in "Item register page no", with: @project_entry.item_register_page_no
    fill_in "Office", with: @project_entry.office_id
    fill_in "Project entry item", with: @project_entry.project_entry_item_id
    fill_in "Quantity", with: @project_entry.quantity
    fill_in "Rate", with: @project_entry.rate
    fill_in "Released to", with: @project_entry.released_to
    fill_in "User", with: @project_entry.user_id
    click_on "Update Project entry"

    assert_text "Project entry was successfully updated"
    click_on "Back"
  end

  test "destroying a Project entry" do
    visit project_entries_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Project entry was successfully destroyed"
  end
end
