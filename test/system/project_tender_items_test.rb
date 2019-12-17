require "application_system_test_case"

class ProjectTenderItemsTest < ApplicationSystemTestCase
  setup do
    @project_tender_item = project_tender_items(:one)
  end

  test "visiting the index" do
    visit project_tender_items_url
    assert_selector "h1", text: "Project Tender Items"
  end

  test "creating a Project tender item" do
    visit project_tender_items_url
    click_on "New Project Tender Item"

    fill_in "Amount", with: @project_tender_item.amount
    fill_in "Fiscal year", with: @project_tender_item.fiscal_year_id
    fill_in "Fy", with: @project_tender_item.fy
    fill_in "Name of item en", with: @project_tender_item.name_of_item_en
    fill_in "Name of item ne", with: @project_tender_item.name_of_item_ne
    fill_in "Office", with: @project_tender_item.office_id
    fill_in "Project purchase tender", with: @project_tender_item.project_purchase_tender_id
    fill_in "Quantity", with: @project_tender_item.quantity
    fill_in "Rate", with: @project_tender_item.rate
    fill_in "Received date", with: @project_tender_item.received_date
    fill_in "Unit en", with: @project_tender_item.unit_en
    fill_in "Unit ne", with: @project_tender_item.unit_ne
    fill_in "User", with: @project_tender_item.user_id
    click_on "Create Project tender item"

    assert_text "Project tender item was successfully created"
    click_on "Back"
  end

  test "updating a Project tender item" do
    visit project_tender_items_url
    click_on "Edit", match: :first

    fill_in "Amount", with: @project_tender_item.amount
    fill_in "Fiscal year", with: @project_tender_item.fiscal_year_id
    fill_in "Fy", with: @project_tender_item.fy
    fill_in "Name of item en", with: @project_tender_item.name_of_item_en
    fill_in "Name of item ne", with: @project_tender_item.name_of_item_ne
    fill_in "Office", with: @project_tender_item.office_id
    fill_in "Project purchase tender", with: @project_tender_item.project_purchase_tender_id
    fill_in "Quantity", with: @project_tender_item.quantity
    fill_in "Rate", with: @project_tender_item.rate
    fill_in "Received date", with: @project_tender_item.received_date
    fill_in "Unit en", with: @project_tender_item.unit_en
    fill_in "Unit ne", with: @project_tender_item.unit_ne
    fill_in "User", with: @project_tender_item.user_id
    click_on "Update Project tender item"

    assert_text "Project tender item was successfully updated"
    click_on "Back"
  end

  test "destroying a Project tender item" do
    visit project_tender_items_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Project tender item was successfully destroyed"
  end
end
