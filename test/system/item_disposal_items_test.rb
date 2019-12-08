require "application_system_test_case"

class ItemDisposalItemsTest < ApplicationSystemTestCase
  setup do
    @item_disposal_item = item_disposal_items(:one)
  end

  test "visiting the index" do
    visit item_disposal_items_url
    assert_selector "h1", text: "Item Disposal Items"
  end

  test "creating a Item disposal item" do
    visit item_disposal_items_url
    click_on "New Item Disposal Item"

    fill_in "Amount", with: @item_disposal_item.amount
    fill_in "Current marked price", with: @item_disposal_item.current_marked_price
    fill_in "Fiscal year", with: @item_disposal_item.fiscal_year_id
    fill_in "Fy", with: @item_disposal_item.fy
    check "Is office item" if @item_disposal_item.is_office_item
    check "Is project item" if @item_disposal_item.is_project_item
    fill_in "Item classification no", with: @item_disposal_item.item_classification_no
    fill_in "Item", with: @item_disposal_item.item_id
    fill_in "Item register page no", with: @item_disposal_item.item_register_page_no
    fill_in "Office", with: @item_disposal_item.office_id
    fill_in "Quantity", with: @item_disposal_item.quantity
    fill_in "Reason for disposal", with: @item_disposal_item.reason_for_disposal
    fill_in "Received date", with: @item_disposal_item.received_date
    fill_in "Remarks", with: @item_disposal_item.remarks
    fill_in "Specification", with: @item_disposal_item.specification
    fill_in "Used year", with: @item_disposal_item.used_year
    fill_in "User", with: @item_disposal_item.user_id
    click_on "Create Item disposal item"

    assert_text "Item disposal item was successfully created"
    click_on "Back"
  end

  test "updating a Item disposal item" do
    visit item_disposal_items_url
    click_on "Edit", match: :first

    fill_in "Amount", with: @item_disposal_item.amount
    fill_in "Current marked price", with: @item_disposal_item.current_marked_price
    fill_in "Fiscal year", with: @item_disposal_item.fiscal_year_id
    fill_in "Fy", with: @item_disposal_item.fy
    check "Is office item" if @item_disposal_item.is_office_item
    check "Is project item" if @item_disposal_item.is_project_item
    fill_in "Item classification no", with: @item_disposal_item.item_classification_no
    fill_in "Item", with: @item_disposal_item.item_id
    fill_in "Item register page no", with: @item_disposal_item.item_register_page_no
    fill_in "Office", with: @item_disposal_item.office_id
    fill_in "Quantity", with: @item_disposal_item.quantity
    fill_in "Reason for disposal", with: @item_disposal_item.reason_for_disposal
    fill_in "Received date", with: @item_disposal_item.received_date
    fill_in "Remarks", with: @item_disposal_item.remarks
    fill_in "Specification", with: @item_disposal_item.specification
    fill_in "Used year", with: @item_disposal_item.used_year
    fill_in "User", with: @item_disposal_item.user_id
    click_on "Update Item disposal item"

    assert_text "Item disposal item was successfully updated"
    click_on "Back"
  end

  test "destroying a Item disposal item" do
    visit item_disposal_items_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Item disposal item was successfully destroyed"
  end
end
