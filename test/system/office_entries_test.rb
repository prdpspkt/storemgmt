require "application_system_test_case"

class OfficeEntriesTest < ApplicationSystemTestCase
  setup do
    @office_purchase_entry = office_entries(:one)
  end

  test "visiting the index" do
    visit officePurchaseEntries_url
    assert_selector "h1", text: "Office Entries"
  end

  test "creating a Office entry" do
    visit officePurchaseEntries_url
    click_on "New Office Entry"

    fill_in "Entry date", with: @office_purchase_entry.entry_date
    fill_in "Entry no", with: @office_purchase_entry.entry_no
    fill_in "Fiscal year", with: @office_purchase_entry.fiscal_year_id
    fill_in "Fy", with: @office_purchase_entry.fy
    fill_in "Office chief designation", with: @office_purchase_entry.office_chief_designation
    fill_in "Office chief name", with: @office_purchase_entry.office_chief_name
    fill_in "Office chief signed date", with: @office_purchase_entry.office_chief_signed_date
    fill_in "Office", with: @office_purchase_entry.office_id
    fill_in "Section chief designation", with: @office_purchase_entry.section_chief_designation
    fill_in "Section chief name", with: @office_purchase_entry.section_chief_name
    fill_in "Section chief signed date", with: @office_purchase_entry.section_chief_signed_date
    fill_in "Store cheif sign date", with: @office_purchase_entry.store_cheif_sign_date
    fill_in "Store chief designation", with: @office_purchase_entry.store_chief_designation
    fill_in "Store chief name", with: @office_purchase_entry.store_chief_name
    fill_in "User", with: @office_purchase_entry.user_id
    click_on "Create Office entry"

    assert_text "Office entry was successfully created"
    click_on "Back"
  end

  test "updating a Office entry" do
    visit officePurchaseEntries_url
    click_on "Edit", match: :first

    fill_in "Entry date", with: @office_purchase_entry.entry_date
    fill_in "Entry no", with: @office_purchase_entry.entry_no
    fill_in "Fiscal year", with: @office_purchase_entry.fiscal_year_id
    fill_in "Fy", with: @office_purchase_entry.fy
    fill_in "Office chief designation", with: @office_purchase_entry.office_chief_designation
    fill_in "Office chief name", with: @office_purchase_entry.office_chief_name
    fill_in "Office chief signed date", with: @office_purchase_entry.office_chief_signed_date
    fill_in "Office", with: @office_purchase_entry.office_id
    fill_in "Section chief designation", with: @office_purchase_entry.section_chief_designation
    fill_in "Section chief name", with: @office_purchase_entry.section_chief_name
    fill_in "Section chief signed date", with: @office_purchase_entry.section_chief_signed_date
    fill_in "Store cheif sign date", with: @office_purchase_entry.store_cheif_sign_date
    fill_in "Store chief designation", with: @office_purchase_entry.store_chief_designation
    fill_in "Store chief name", with: @office_purchase_entry.store_chief_name
    fill_in "User", with: @office_purchase_entry.user_id
    click_on "Update Office entry"

    assert_text "Office entry was successfully updated"
    click_on "Back"
  end

  test "destroying a Office entry" do
    visit officePurchaseEntries_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Office entry was successfully destroyed"
  end
end
