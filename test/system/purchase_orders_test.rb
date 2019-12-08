require "application_system_test_case"

class PurchaseOrdersTest < ApplicationSystemTestCase
  setup do
    @purchase_order = purchase_orders(:one)
  end

  test "visiting the index" do
    visit purchase_orders_url
    assert_selector "h1", text: "Purchase Orders"
  end

  test "creating a Purchase order" do
    visit purchase_orders_url
    click_on "New Purchase Order"

    fill_in "Date to receive goods", with: @purchase_order.date_to_receive_goods
    fill_in "Fiscal year", with: @purchase_order.fiscal_year_id
    fill_in "Fy", with: @purchase_order.fy
    fill_in "Office address", with: @purchase_order.office_address
    fill_in "Office cheif name", with: @purchase_order.office_cheif_name
    fill_in "Office cheif signed date", with: @purchase_order.office_cheif_signed_date
    fill_in "Office", with: @purchase_order.office_id
    fill_in "Office name", with: @purchase_order.office_name
    fill_in "Order date", with: @purchase_order.order_date
    fill_in "Order decision date", with: @purchase_order.order_decision_date
    fill_in "Order decision no", with: @purchase_order.order_decision_no
    fill_in "Order no", with: @purchase_order.order_no
    fill_in "Section chief name", with: @purchase_order.section_chief_name
    fill_in "Section chief signed date", with: @purchase_order.section_chief_signed_date
    fill_in "Store chief name", with: @purchase_order.store_chief_name
    fill_in "Store chief signed date", with: @purchase_order.store_chief_signed_date
    fill_in "User", with: @purchase_order.user_id
    fill_in "Vendor address", with: @purchase_order.vendor_address
    fill_in "Vendor name", with: @purchase_order.vendor_name
    fill_in "Vendor pan", with: @purchase_order.vendor_pan
    fill_in "Vendor phone", with: @purchase_order.vendor_phone
    fill_in "Vendor registration", with: @purchase_order.vendor_registration
    click_on "Create Purchase order"

    assert_text "Purchase order was successfully created"
    click_on "Back"
  end

  test "updating a Purchase order" do
    visit purchase_orders_url
    click_on "Edit", match: :first

    fill_in "Date to receive goods", with: @purchase_order.date_to_receive_goods
    fill_in "Fiscal year", with: @purchase_order.fiscal_year_id
    fill_in "Fy", with: @purchase_order.fy
    fill_in "Office address", with: @purchase_order.office_address
    fill_in "Office cheif name", with: @purchase_order.office_cheif_name
    fill_in "Office cheif signed date", with: @purchase_order.office_cheif_signed_date
    fill_in "Office", with: @purchase_order.office_id
    fill_in "Office name", with: @purchase_order.office_name
    fill_in "Order date", with: @purchase_order.order_date
    fill_in "Order decision date", with: @purchase_order.order_decision_date
    fill_in "Order decision no", with: @purchase_order.order_decision_no
    fill_in "Order no", with: @purchase_order.order_no
    fill_in "Section chief name", with: @purchase_order.section_chief_name
    fill_in "Section chief signed date", with: @purchase_order.section_chief_signed_date
    fill_in "Store chief name", with: @purchase_order.store_chief_name
    fill_in "Store chief signed date", with: @purchase_order.store_chief_signed_date
    fill_in "User", with: @purchase_order.user_id
    fill_in "Vendor address", with: @purchase_order.vendor_address
    fill_in "Vendor name", with: @purchase_order.vendor_name
    fill_in "Vendor pan", with: @purchase_order.vendor_pan
    fill_in "Vendor phone", with: @purchase_order.vendor_phone
    fill_in "Vendor registration", with: @purchase_order.vendor_registration
    click_on "Update Purchase order"

    assert_text "Purchase order was successfully updated"
    click_on "Back"
  end

  test "destroying a Purchase order" do
    visit purchase_orders_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Purchase order was successfully destroyed"
  end
end
