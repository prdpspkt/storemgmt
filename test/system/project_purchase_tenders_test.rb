require "application_system_test_case"

class ProjectPurchaseTendersTest < ApplicationSystemTestCase
  setup do
    @project_purchase_tender = project_purchase_tenders(:one)
  end

  test "visiting the index" do
    visit project_tenders_url
    assert_selector "h1", text: "Project Purchase Tenders"
  end

  test "creating a Project purchase tender" do
    visit project_tenders_url
    click_on "New Project Purchase Tender"

    fill_in "Bidders address", with: @project_purchase_tender.bidders_address
    fill_in "Bidders name", with: @project_purchase_tender.bidders_name
    fill_in "Fiscal yeaer", with: @project_purchase_tender.fiscal_yeaer_id
    check "Marked as final" if @project_purchase_tender.marked_as_final
    fill_in "Office", with: @project_purchase_tender.office_id
    fill_in "Tender date", with: @project_purchase_tender.tender_date
    fill_in "Tender name", with: @project_purchase_tender.tender_name
    fill_in "Tender no", with: @project_purchase_tender.tender_no
    fill_in "User", with: @project_purchase_tender.user_id
    click_on "Create Project purchase tender"

    assert_text "Project purchase tender was successfully created"
    click_on "Back"
  end

  test "updating a Project purchase tender" do
    visit project_tenders_url
    click_on "Edit", match: :first

    fill_in "Bidders address", with: @project_purchase_tender.bidders_address
    fill_in "Bidders name", with: @project_purchase_tender.bidders_name
    fill_in "Fiscal yeaer", with: @project_purchase_tender.fiscal_yeaer_id
    check "Marked as final" if @project_purchase_tender.marked_as_final
    fill_in "Office", with: @project_purchase_tender.office_id
    fill_in "Tender date", with: @project_purchase_tender.tender_date
    fill_in "Tender name", with: @project_purchase_tender.tender_name
    fill_in "Tender no", with: @project_purchase_tender.tender_no
    fill_in "User", with: @project_purchase_tender.user_id
    click_on "Update Project purchase tender"

    assert_text "Project purchase tender was successfully updated"
    click_on "Back"
  end

  test "destroying a Project purchase tender" do
    visit project_tenders_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Project purchase tender was successfully destroyed"
  end
end
