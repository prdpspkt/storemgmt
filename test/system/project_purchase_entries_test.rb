require "application_system_test_case"

class ProjectPurchaseEntriesTest < ApplicationSystemTestCase
  setup do
    @project_purchase_entry = project_purchase_entries(:one)
  end

  test "visiting the index" do
    visit project_purchase_entries_url
    assert_selector "h1", text: "Project Purchase Entries"
  end

  test "creating a Project purchase entry" do
    visit project_purchase_entries_url
    click_on "New Project Purchase Entry"

    fill_in "Entry date", with: @project_purchase_entry.entry_date
    fill_in "Entry no", with: @project_purchase_entry.entry_no
    fill_in "Fiscal year", with: @project_purchase_entry.fiscal_year_id
    fill_in "Fy", with: @project_purchase_entry.fy
    fill_in "Office chief designation", with: @project_purchase_entry.office_chief_designation
    fill_in "Office chief name", with: @project_purchase_entry.office_chief_name
    fill_in "Office chief signed date", with: @project_purchase_entry.office_chief_signed_date
    fill_in "Office", with: @project_purchase_entry.office_id
    fill_in "Section chief designation", with: @project_purchase_entry.section_chief_designation
    fill_in "Section chief name", with: @project_purchase_entry.section_chief_name
    fill_in "Section chief signed date", with: @project_purchase_entry.section_chief_signed_date
    fill_in "Store cheif sign date", with: @project_purchase_entry.store_cheif_sign_date
    fill_in "Store chief designation", with: @project_purchase_entry.store_chief_designation
    fill_in "Store chief name", with: @project_purchase_entry.store_chief_name
    fill_in "User", with: @project_purchase_entry.user_id
    click_on "Create Project purchase entry"

    assert_text "Project purchase entry was successfully created"
    click_on "Back"
  end

  test "updating a Project purchase entry" do
    visit project_purchase_entries_url
    click_on "Edit", match: :first

    fill_in "Entry date", with: @project_purchase_entry.entry_date
    fill_in "Entry no", with: @project_purchase_entry.entry_no
    fill_in "Fiscal year", with: @project_purchase_entry.fiscal_year_id
    fill_in "Fy", with: @project_purchase_entry.fy
    fill_in "Office chief designation", with: @project_purchase_entry.office_chief_designation
    fill_in "Office chief name", with: @project_purchase_entry.office_chief_name
    fill_in "Office chief signed date", with: @project_purchase_entry.office_chief_signed_date
    fill_in "Office", with: @project_purchase_entry.office_id
    fill_in "Section chief designation", with: @project_purchase_entry.section_chief_designation
    fill_in "Section chief name", with: @project_purchase_entry.section_chief_name
    fill_in "Section chief signed date", with: @project_purchase_entry.section_chief_signed_date
    fill_in "Store cheif sign date", with: @project_purchase_entry.store_cheif_sign_date
    fill_in "Store chief designation", with: @project_purchase_entry.store_chief_designation
    fill_in "Store chief name", with: @project_purchase_entry.store_chief_name
    fill_in "User", with: @project_purchase_entry.user_id
    click_on "Update Project purchase entry"

    assert_text "Project purchase entry was successfully updated"
    click_on "Back"
  end

  test "destroying a Project purchase entry" do
    visit project_purchase_entries_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Project purchase entry was successfully destroyed"
  end
end
