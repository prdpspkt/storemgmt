require 'test_helper'

class ProjectPurchaseOrderItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @project_purchase_order_item = project_purchase_order_items(:one)
  end

  test "should get index" do
    get project_purchase_order_items_url
    assert_response :success
  end

  test "should get new" do
    get new_project_purchase_order_item_url
    assert_response :success
  end

  test "should create project_purchase_order_item" do
    assert_difference('ProjectPurchaseOrderItem.count') do
      post project_purchase_order_items_url, params: { project_purchase_order_item: { amount: @project_purchase_order_item.amount, fiscal_year_id: @project_purchase_order_item.fiscal_year_id, fy: @project_purchase_order_item.fy, item_classification_no: @project_purchase_order_item.item_classification_no, item_id: @project_purchase_order_item.item_id, name_of_item_en: @project_purchase_order_item.name_of_item_en, name_of_item_ne: @project_purchase_order_item.name_of_item_ne, office_id: @project_purchase_order_item.office_id, project_id: @project_purchase_order_item.project_id, project_purchase_order_id: @project_purchase_order_item.project_purchase_order_id, quantity: @project_purchase_order_item.quantity, rate: @project_purchase_order_item.rate, remarks: @project_purchase_order_item.remarks, specification: @project_purchase_order_item.specification, unit_en: @project_purchase_order_item.unit_en, unit_ne: @project_purchase_order_item.unit_ne } }
    end

    assert_redirected_to project_purchase_order_item_url(ProjectPurchaseOrderItem.last)
  end

  test "should show project_purchase_order_item" do
    get project_purchase_order_item_url(@project_purchase_order_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_project_purchase_order_item_url(@project_purchase_order_item)
    assert_response :success
  end

  test "should update project_purchase_order_item" do
    patch project_purchase_order_item_url(@project_purchase_order_item), params: { project_purchase_order_item: { amount: @project_purchase_order_item.amount, fiscal_year_id: @project_purchase_order_item.fiscal_year_id, fy: @project_purchase_order_item.fy, item_classification_no: @project_purchase_order_item.item_classification_no, item_id: @project_purchase_order_item.item_id, name_of_item_en: @project_purchase_order_item.name_of_item_en, name_of_item_ne: @project_purchase_order_item.name_of_item_ne, office_id: @project_purchase_order_item.office_id, project_id: @project_purchase_order_item.project_id, project_purchase_order_id: @project_purchase_order_item.project_purchase_order_id, quantity: @project_purchase_order_item.quantity, rate: @project_purchase_order_item.rate, remarks: @project_purchase_order_item.remarks, specification: @project_purchase_order_item.specification, unit_en: @project_purchase_order_item.unit_en, unit_ne: @project_purchase_order_item.unit_ne } }
    assert_redirected_to project_purchase_order_item_url(@project_purchase_order_item)
  end

  test "should destroy project_purchase_order_item" do
    assert_difference('ProjectPurchaseOrderItem.count', -1) do
      delete project_purchase_order_item_url(@project_purchase_order_item)
    end

    assert_redirected_to project_purchase_order_items_url
  end
end
