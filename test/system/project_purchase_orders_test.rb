require "application_system_test_case"

class ProjectPurchaseOrdersTest < ApplicationSystemTestCase
  setup do
    @project_purchase_order = project_purchase_orders(:one)
  end

  test "visiting the index" do
    visit project_purchase_orders_url
    assert_selector "h1", text: "Project Purchase Orders"
  end

  test "creating a Project purchase order" do
    visit project_purchase_orders_url
    click_on "New Project Purchase Order"

    fill_in "Fiscal year signed date", with: @project_purchase_order.fiscal_year_signed_date
    fill_in "Fy", with: @project_purchase_order.fy
    check "Marked as final" if @project_purchase_order.marked_as_final
    fill_in "Office address", with: @project_purchase_order.office_address
    fill_in "Office chief name", with: @project_purchase_order.office_chief_name
    fill_in "Office chief signed date", with: @project_purchase_order.office_chief_signed_date
    fill_in "Office", with: @project_purchase_order.office_id
    fill_in "Office name", with: @project_purchase_order.office_name
    fill_in "Order date", with: @project_purchase_order.order_date
    fill_in "Order decision date", with: @project_purchase_order.order_decision_date
    fill_in "Order decision no", with: @project_purchase_order.order_decision_no
    fill_in "Order no", with: @project_purchase_order.order_no
    fill_in "Project", with: @project_purchase_order.project_id
    fill_in "Section cheif signed date", with: @project_purchase_order.section_cheif_signed_date
    fill_in "Section chief name", with: @project_purchase_order.section_chief_name
    fill_in "Store chief name", with: @project_purchase_order.store_chief_name
    fill_in "Store chief signed date", with: @project_purchase_order.store_chief_signed_date
    fill_in "User", with: @project_purchase_order.user_id
    fill_in "Vendor address", with: @project_purchase_order.vendor_address
    fill_in "Vendor name", with: @project_purchase_order.vendor_name
    fill_in "Vendor pan", with: @project_purchase_order.vendor_pan
    fill_in "Vendor phone", with: @project_purchase_order.vendor_phone
    fill_in "Vendor registration", with: @project_purchase_order.vendor_registration
    click_on "Create Project purchase order"

    assert_text "Project purchase order was successfully created"
    click_on "Back"
  end

  test "updating a Project purchase order" do
    visit project_purchase_orders_url
    click_on "Edit", match: :first

    fill_in "Fiscal year signed date", with: @project_purchase_order.fiscal_year_signed_date
    fill_in "Fy", with: @project_purchase_order.fy
    check "Marked as final" if @project_purchase_order.marked_as_final
    fill_in "Office address", with: @project_purchase_order.office_address
    fill_in "Office chief name", with: @project_purchase_order.office_chief_name
    fill_in "Office chief signed date", with: @project_purchase_order.office_chief_signed_date
    fill_in "Office", with: @project_purchase_order.office_id
    fill_in "Office name", with: @project_purchase_order.office_name
    fill_in "Order date", with: @project_purchase_order.order_date
    fill_in "Order decision date", with: @project_purchase_order.order_decision_date
    fill_in "Order decision no", with: @project_purchase_order.order_decision_no
    fill_in "Order no", with: @project_purchase_order.order_no
    fill_in "Project", with: @project_purchase_order.project_id
    fill_in "Section cheif signed date", with: @project_purchase_order.section_cheif_signed_date
    fill_in "Section chief name", with: @project_purchase_order.section_chief_name
    fill_in "Store chief name", with: @project_purchase_order.store_chief_name
    fill_in "Store chief signed date", with: @project_purchase_order.store_chief_signed_date
    fill_in "User", with: @project_purchase_order.user_id
    fill_in "Vendor address", with: @project_purchase_order.vendor_address
    fill_in "Vendor name", with: @project_purchase_order.vendor_name
    fill_in "Vendor pan", with: @project_purchase_order.vendor_pan
    fill_in "Vendor phone", with: @project_purchase_order.vendor_phone
    fill_in "Vendor registration", with: @project_purchase_order.vendor_registration
    click_on "Update Project purchase order"

    assert_text "Project purchase order was successfully updated"
    click_on "Back"
  end

  test "destroying a Project purchase order" do
    visit project_purchase_orders_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Project purchase order was successfully destroyed"
  end
end
