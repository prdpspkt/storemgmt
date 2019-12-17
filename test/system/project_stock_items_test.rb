require "application_system_test_case"

class ProjectStockItemsTest < ApplicationSystemTestCase
  setup do
    @project_stock_item = project_stock_items(:one)
  end

  test "visiting the index" do
    visit project_stock_items_url
    assert_selector "h1", text: "Project Stock Items"
  end

  test "creating a Project stock item" do
    visit project_stock_items_url
    click_on "New Project Stock Item"

    fill_in "Amount", with: @project_stock_item.amount
    fill_in "Fiscal year", with: @project_stock_item.fiscal_year_id
    fill_in "Item classification no", with: @project_stock_item.item_classification_no
    fill_in "Item", with: @project_stock_item.item_id
    fill_in "Item register page no", with: @project_stock_item.item_register_page_no
    fill_in "Name of item en", with: @project_stock_item.name_of_item_en
    fill_in "Name of item ne", with: @project_stock_item.name_of_item_ne
    fill_in "Office", with: @project_stock_item.office_id
    fill_in "Physical status", with: @project_stock_item.physical_status
    fill_in "Project", with: @project_stock_item.project_id
    fill_in "Quantity", with: @project_stock_item.quantity
    fill_in "Rate", with: @project_stock_item.rate
    fill_in "Remarks", with: @project_stock_item.remarks
    fill_in "Unit en", with: @project_stock_item.unit_en
    fill_in "Unit ne", with: @project_stock_item.unit_ne
    fill_in "User", with: @project_stock_item.user_id
    click_on "Create Project stock item"

    assert_text "Project stock item was successfully created"
    click_on "Back"
  end

  test "updating a Project stock item" do
    visit project_stock_items_url
    click_on "Edit", match: :first

    fill_in "Amount", with: @project_stock_item.amount
    fill_in "Fiscal year", with: @project_stock_item.fiscal_year_id
    fill_in "Item classification no", with: @project_stock_item.item_classification_no
    fill_in "Item", with: @project_stock_item.item_id
    fill_in "Item register page no", with: @project_stock_item.item_register_page_no
    fill_in "Name of item en", with: @project_stock_item.name_of_item_en
    fill_in "Name of item ne", with: @project_stock_item.name_of_item_ne
    fill_in "Office", with: @project_stock_item.office_id
    fill_in "Physical status", with: @project_stock_item.physical_status
    fill_in "Project", with: @project_stock_item.project_id
    fill_in "Quantity", with: @project_stock_item.quantity
    fill_in "Rate", with: @project_stock_item.rate
    fill_in "Remarks", with: @project_stock_item.remarks
    fill_in "Unit en", with: @project_stock_item.unit_en
    fill_in "Unit ne", with: @project_stock_item.unit_ne
    fill_in "User", with: @project_stock_item.user_id
    click_on "Update Project stock item"

    assert_text "Project stock item was successfully updated"
    click_on "Back"
  end

  test "destroying a Project stock item" do
    visit project_stock_items_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Project stock item was successfully destroyed"
  end
end
