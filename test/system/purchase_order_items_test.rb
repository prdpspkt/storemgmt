require "application_system_test_case"

class PurchaseOrderItemsTest < ApplicationSystemTestCase
  setup do
    @purchase_order_item = purchase_order_items(:one)
  end

  test "visiting the index" do
    visit purchase_order_items_url
    assert_selector "h1", text: "Purchase Order Items"
  end

  test "creating a Purchase order item" do
    visit purchase_order_items_url
    click_on "New Purchase Order Item"

    fill_in "Amount", with: @purchase_order_item.amount
    fill_in "Fiscal year", with: @purchase_order_item.fiscal_year_id
    fill_in "Fy", with: @purchase_order_item.fy
    fill_in "Item classification no", with: @purchase_order_item.item_classification_no
    fill_in "Name of item", with: @purchase_order_item.name_of_item
    fill_in "Office", with: @purchase_order_item.office_id
    fill_in "Purchase order", with: @purchase_order_item.purchase_order_id
    fill_in "Quantity", with: @purchase_order_item.quantity
    fill_in "Rate", with: @purchase_order_item.rate
    fill_in "Remarks", with: @purchase_order_item.remarks
    fill_in "Specification", with: @purchase_order_item.specification
    fill_in "Unit", with: @purchase_order_item.unit
    fill_in "User", with: @purchase_order_item.user_id
    click_on "Create Purchase order item"

    assert_text "Purchase order item was successfully created"
    click_on "Back"
  end

  test "updating a Purchase order item" do
    visit purchase_order_items_url
    click_on "Edit", match: :first

    fill_in "Amount", with: @purchase_order_item.amount
    fill_in "Fiscal year", with: @purchase_order_item.fiscal_year_id
    fill_in "Fy", with: @purchase_order_item.fy
    fill_in "Item classification no", with: @purchase_order_item.item_classification_no
    fill_in "Name of item", with: @purchase_order_item.name_of_item
    fill_in "Office", with: @purchase_order_item.office_id
    fill_in "Purchase order", with: @purchase_order_item.purchase_order_id
    fill_in "Quantity", with: @purchase_order_item.quantity
    fill_in "Rate", with: @purchase_order_item.rate
    fill_in "Remarks", with: @purchase_order_item.remarks
    fill_in "Specification", with: @purchase_order_item.specification
    fill_in "Unit", with: @purchase_order_item.unit
    fill_in "User", with: @purchase_order_item.user_id
    click_on "Update Purchase order item"

    assert_text "Purchase order item was successfully updated"
    click_on "Back"
  end

  test "destroying a Purchase order item" do
    visit purchase_order_items_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Purchase order item was successfully destroyed"
  end
end
