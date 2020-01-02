require "application_system_test_case"

class ProjectTenderBreakdownItemsTest < ApplicationSystemTestCase
  setup do
    @project_tender_breakdown_item = project_tender_breakdown_items(:one)
  end

  test "visiting the index" do
    visit project_tender_breakdown_items_url
    assert_selector "h1", text: "Project Tender Breakdown Items"
  end

  test "creating a Project tender breakdown item" do
    visit project_tender_breakdown_items_url
    click_on "New Project Tender Breakdown Item"

    fill_in "Amount", with: @project_tender_breakdown_item.amount
    fill_in "Fiscal year", with: @project_tender_breakdown_item.fiscal_year_id
    fill_in "Name item en", with: @project_tender_breakdown_item.name_item_en
    fill_in "Name of item ne", with: @project_tender_breakdown_item.name_of_item_ne
    fill_in "Office", with: @project_tender_breakdown_item.office_id
    fill_in "Project tender breakdown", with: @project_tender_breakdown_item.project_tender_breakdown_id
    fill_in "Project tender item", with: @project_tender_breakdown_item.project_tender_item_id
    fill_in "Quantity", with: @project_tender_breakdown_item.quantity
    fill_in "Rate", with: @project_tender_breakdown_item.rate
    fill_in "Received date", with: @project_tender_breakdown_item.received_date
    fill_in "Unit en", with: @project_tender_breakdown_item.unit_en
    fill_in "Unit ne", with: @project_tender_breakdown_item.unit_ne
    fill_in "User", with: @project_tender_breakdown_item.user_id
    click_on "Create Project tender breakdown item"

    assert_text "Project tender breakdown item was successfully created"
    click_on "Back"
  end

  test "updating a Project tender breakdown item" do
    visit project_tender_breakdown_items_url
    click_on "Edit", match: :first

    fill_in "Amount", with: @project_tender_breakdown_item.amount
    fill_in "Fiscal year", with: @project_tender_breakdown_item.fiscal_year_id
    fill_in "Name item en", with: @project_tender_breakdown_item.name_item_en
    fill_in "Name of item ne", with: @project_tender_breakdown_item.name_of_item_ne
    fill_in "Office", with: @project_tender_breakdown_item.office_id
    fill_in "Project tender breakdown", with: @project_tender_breakdown_item.project_tender_breakdown_id
    fill_in "Project tender item", with: @project_tender_breakdown_item.project_tender_item_id
    fill_in "Quantity", with: @project_tender_breakdown_item.quantity
    fill_in "Rate", with: @project_tender_breakdown_item.rate
    fill_in "Received date", with: @project_tender_breakdown_item.received_date
    fill_in "Unit en", with: @project_tender_breakdown_item.unit_en
    fill_in "Unit ne", with: @project_tender_breakdown_item.unit_ne
    fill_in "User", with: @project_tender_breakdown_item.user_id
    click_on "Update Project tender breakdown item"

    assert_text "Project tender breakdown item was successfully updated"
    click_on "Back"
  end

  test "destroying a Project tender breakdown item" do
    visit project_tender_breakdown_items_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Project tender breakdown item was successfully destroyed"
  end
end
