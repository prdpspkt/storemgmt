require "application_system_test_case"

class OfficeStockItemsTest < ApplicationSystemTestCase
  setup do
    @office_stock_item = office_stock_items(:one)
  end

  test "visiting the index" do
    visit office_stock_items_url
    assert_selector "h1", text: "Office Stock Items"
  end

  test "creating a Office stock item" do
    visit office_stock_items_url
    click_on "New Office Stock Item"

    fill_in "Amount", with: @office_stock_item.amount
    fill_in "Fiscal year", with: @office_stock_item.fiscal_year_id
    fill_in "Item classification no", with: @office_stock_item.item_classification_no
    fill_in "Item register page no", with: @office_stock_item.item_register_page_no
    fill_in "Name of item", with: @office_stock_item.name_of_item
    fill_in "Office", with: @office_stock_item.office_id
    fill_in "Office item", with: @office_stock_item.office_item_id
    fill_in "Physical status", with: @office_stock_item.physical_status
    fill_in "Quantity", with: @office_stock_item.quantity
    fill_in "Rate", with: @office_stock_item.rate
    fill_in "Remarks", with: @office_stock_item.remarks
    fill_in "Unit", with: @office_stock_item.unit
    fill_in "User", with: @office_stock_item.user_id
    click_on "Create Office stock item"

    assert_text "Office stock item was successfully created"
    click_on "Back"
  end

  test "updating a Office stock item" do
    visit office_stock_items_url
    click_on "Edit", match: :first

    fill_in "Amount", with: @office_stock_item.amount
    fill_in "Fiscal year", with: @office_stock_item.fiscal_year_id
    fill_in "Item classification no", with: @office_stock_item.item_classification_no
    fill_in "Item register page no", with: @office_stock_item.item_register_page_no
    fill_in "Name of item", with: @office_stock_item.name_of_item
    fill_in "Office", with: @office_stock_item.office_id
    fill_in "Office item", with: @office_stock_item.office_item_id
    fill_in "Physical status", with: @office_stock_item.physical_status
    fill_in "Quantity", with: @office_stock_item.quantity
    fill_in "Rate", with: @office_stock_item.rate
    fill_in "Remarks", with: @office_stock_item.remarks
    fill_in "Unit", with: @office_stock_item.unit
    fill_in "User", with: @office_stock_item.user_id
    click_on "Update Office stock item"

    assert_text "Office stock item was successfully updated"
    click_on "Back"
  end

  test "destroying a Office stock item" do
    visit office_stock_items_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Office stock item was successfully destroyed"
  end
end
