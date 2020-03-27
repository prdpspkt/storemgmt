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

    check "Accepted" if @project_purchase_entry.accepted
    fill_in "Entry date", with: @project_purchase_entry.entry_date
    check "Entry generated" if @project_purchase_entry.entry_generated
    fill_in "Entry no", with: @project_purchase_entry.entry_no
    fill_in "Fiscal year", with: @project_purchase_entry.fiscal_year_id
    fill_in "Office chief signed date", with: @project_purchase_entry.office_chief_signed_date
    fill_in "Office", with: @project_purchase_entry.office_id
    fill_in "Project", with: @project_purchase_entry.project_id
    fill_in "Purchase order", with: @project_purchase_entry.purchase_order_id
    fill_in "Section chief signed date", with: @project_purchase_entry.section_chief_signed_date
    fill_in "Store body", with: @project_purchase_entry.store_body_id
    fill_in "Store keeper signed date", with: @project_purchase_entry.store_keeper_signed_date
    fill_in "Tender", with: @project_purchase_entry.tender_id
    fill_in "User", with: @project_purchase_entry.user_id
    click_on "Create Project purchase entry"

    assert_text "Project purchase entry was successfully created"
    click_on "Back"
  end

  test "updating a Project purchase entry" do
    visit project_purchase_entries_url
    click_on "Edit", match: :first

    check "Accepted" if @project_purchase_entry.accepted
    fill_in "Entry date", with: @project_purchase_entry.entry_date
    check "Entry generated" if @project_purchase_entry.entry_generated
    fill_in "Entry no", with: @project_purchase_entry.entry_no
    fill_in "Fiscal year", with: @project_purchase_entry.fiscal_year_id
    fill_in "Office chief signed date", with: @project_purchase_entry.office_chief_signed_date
    fill_in "Office", with: @project_purchase_entry.office_id
    fill_in "Project", with: @project_purchase_entry.project_id
    fill_in "Purchase order", with: @project_purchase_entry.purchase_order_id
    fill_in "Section chief signed date", with: @project_purchase_entry.section_chief_signed_date
    fill_in "Store body", with: @project_purchase_entry.store_body_id
    fill_in "Store keeper signed date", with: @project_purchase_entry.store_keeper_signed_date
    fill_in "Tender", with: @project_purchase_entry.tender_id
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
