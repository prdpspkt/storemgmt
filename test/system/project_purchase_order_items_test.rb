require "application_system_test_case"

class ProjectPurchaseOrderItemsTest < ApplicationSystemTestCase
  setup do
    @project_purchase_order_item = project_purchase_order_items(:one)
  end

  test "visiting the index" do
    visit project_purchase_order_items_url
    assert_selector "h1", text: "Project Purchase Order Items"
  end

  test "creating a Project purchase order item" do
    visit project_purchase_order_items_url
    click_on "New Project Purchase Order Item"

    fill_in "Amount", with: @project_purchase_order_item.amount
    fill_in "Fiscal year", with: @project_purchase_order_item.fiscal_year_id
    fill_in "Fy", with: @project_purchase_order_item.fy
    fill_in "Item classification no", with: @project_purchase_order_item.item_classification_no
    fill_in "Item", with: @project_purchase_order_item.item_id
    fill_in "Name of item en", with: @project_purchase_order_item.name_of_item_en
    fill_in "Name of item ne", with: @project_purchase_order_item.name_of_item_ne
    fill_in "Office", with: @project_purchase_order_item.office_id
    fill_in "Project", with: @project_purchase_order_item.project_id
    fill_in "Project purchase order", with: @project_purchase_order_item.project_purchase_order_id
    fill_in "Quantity", with: @project_purchase_order_item.quantity
    fill_in "Rate", with: @project_purchase_order_item.rate
    fill_in "Remarks", with: @project_purchase_order_item.remarks
    fill_in "Specification", with: @project_purchase_order_item.specification
    fill_in "Unit en", with: @project_purchase_order_item.unit_en
    fill_in "Unit ne", with: @project_purchase_order_item.unit_ne
    click_on "Create Project purchase order item"

    assert_text "Project purchase order item was successfully created"
    click_on "Back"
  end

  test "updating a Project purchase order item" do
    visit project_purchase_order_items_url
    click_on "Edit", match: :first

    fill_in "Amount", with: @project_purchase_order_item.amount
    fill_in "Fiscal year", with: @project_purchase_order_item.fiscal_year_id
    fill_in "Fy", with: @project_purchase_order_item.fy
    fill_in "Item classification no", with: @project_purchase_order_item.item_classification_no
    fill_in "Item", with: @project_purchase_order_item.item_id
    fill_in "Name of item en", with: @project_purchase_order_item.name_of_item_en
    fill_in "Name of item ne", with: @project_purchase_order_item.name_of_item_ne
    fill_in "Office", with: @project_purchase_order_item.office_id
    fill_in "Project", with: @project_purchase_order_item.project_id
    fill_in "Project purchase order", with: @project_purchase_order_item.project_purchase_order_id
    fill_in "Quantity", with: @project_purchase_order_item.quantity
    fill_in "Rate", with: @project_purchase_order_item.rate
    fill_in "Remarks", with: @project_purchase_order_item.remarks
    fill_in "Specification", with: @project_purchase_order_item.specification
    fill_in "Unit en", with: @project_purchase_order_item.unit_en
    fill_in "Unit ne", with: @project_purchase_order_item.unit_ne
    click_on "Update Project purchase order item"

    assert_text "Project purchase order item was successfully updated"
    click_on "Back"
  end

  test "destroying a Project purchase order item" do
    visit project_purchase_order_items_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Project purchase order item was successfully destroyed"
  end
end
