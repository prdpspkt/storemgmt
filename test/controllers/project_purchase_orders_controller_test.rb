require 'test_helper'

class ProjectPurchaseOrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @project_purchase_order = project_purchase_orders(:one)
  end

  test "should get index" do
    get project_purchase_orders_url
    assert_response :success
  end

  test "should get new" do
    get new_project_purchase_order_url
    assert_response :success
  end

  test "should create project_purchase_order" do
    assert_difference('ProjectPurchaseOrder.count') do
      post project_purchase_orders_url, params: { project_purchase_order: { fiscal_year_signed_date: @project_purchase_order.fiscal_year_signed_date, fy: @project_purchase_order.fy, marked_as_final: @project_purchase_order.marked_as_final, office_address: @project_purchase_order.office_address, office_chief_name: @project_purchase_order.office_chief_name, office_chief_signed_date: @project_purchase_order.office_chief_signed_date, office_id: @project_purchase_order.office_id, office_name: @project_purchase_order.office_name, order_date: @project_purchase_order.order_date, order_decision_date: @project_purchase_order.order_decision_date, order_decision_no: @project_purchase_order.order_decision_no, order_no: @project_purchase_order.order_no, project_id: @project_purchase_order.project_id, section_cheif_signed_date: @project_purchase_order.section_cheif_signed_date, section_chief_name: @project_purchase_order.section_chief_name, store_chief_name: @project_purchase_order.store_chief_name, store_chief_signed_date: @project_purchase_order.store_chief_signed_date, user_id: @project_purchase_order.user_id, vendor_address: @project_purchase_order.vendor_address, vendor_name: @project_purchase_order.vendor_name, vendor_pan: @project_purchase_order.vendor_pan, vendor_phone: @project_purchase_order.vendor_phone, vendor_registration: @project_purchase_order.vendor_registration } }
    end

    assert_redirected_to project_purchase_order_url(ProjectPurchaseOrder.last)
  end

  test "should show project_purchase_order" do
    get project_purchase_order_url(@project_purchase_order)
    assert_response :success
  end

  test "should get edit" do
    get edit_project_purchase_order_url(@project_purchase_order)
    assert_response :success
  end

  test "should update project_purchase_order" do
    patch project_purchase_order_url(@project_purchase_order), params: { project_purchase_order: { fiscal_year_signed_date: @project_purchase_order.fiscal_year_signed_date, fy: @project_purchase_order.fy, marked_as_final: @project_purchase_order.marked_as_final, office_address: @project_purchase_order.office_address, office_chief_name: @project_purchase_order.office_chief_name, office_chief_signed_date: @project_purchase_order.office_chief_signed_date, office_id: @project_purchase_order.office_id, office_name: @project_purchase_order.office_name, order_date: @project_purchase_order.order_date, order_decision_date: @project_purchase_order.order_decision_date, order_decision_no: @project_purchase_order.order_decision_no, order_no: @project_purchase_order.order_no, project_id: @project_purchase_order.project_id, section_cheif_signed_date: @project_purchase_order.section_cheif_signed_date, section_chief_name: @project_purchase_order.section_chief_name, store_chief_name: @project_purchase_order.store_chief_name, store_chief_signed_date: @project_purchase_order.store_chief_signed_date, user_id: @project_purchase_order.user_id, vendor_address: @project_purchase_order.vendor_address, vendor_name: @project_purchase_order.vendor_name, vendor_pan: @project_purchase_order.vendor_pan, vendor_phone: @project_purchase_order.vendor_phone, vendor_registration: @project_purchase_order.vendor_registration } }
    assert_redirected_to project_purchase_order_url(@project_purchase_order)
  end

  test "should destroy project_purchase_order" do
    assert_difference('ProjectPurchaseOrder.count', -1) do
      delete project_purchase_order_url(@project_purchase_order)
    end

    assert_redirected_to project_purchase_orders_url
  end
end
