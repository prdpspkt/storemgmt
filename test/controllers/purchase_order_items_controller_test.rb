require 'test_helper'

class PurchaseOrderItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @purchase_order_item = purchase_order_items(:one)
  end

  test "should get index" do
    get purchase_order_items_url
    assert_response :success
  end

  test "should get new" do
    get new_purchase_order_item_url
    assert_response :success
  end

  test "should create purchase_order_item" do
    assert_difference('PurchaseOrderItem.count') do
      post purchase_order_items_url, params: { purchase_order_item: { amount: @purchase_order_item.amount, fiscal_year_id: @purchase_order_item.fiscal_year_id, fy: @purchase_order_item.fy, item_classification_no: @purchase_order_item.item_classification_no, name_of_item: @purchase_order_item.name_of_item, office_id: @purchase_order_item.office_id, purchase_order_id: @purchase_order_item.purchase_order_id, quantity: @purchase_order_item.quantity, rate: @purchase_order_item.rate, remarks: @purchase_order_item.remarks, specification: @purchase_order_item.specification, unit: @purchase_order_item.unit, user_id: @purchase_order_item.user_id } }
    end

    assert_redirected_to purchase_order_item_url(PurchaseOrderItem.last)
  end

  test "should show purchase_order_item" do
    get purchase_order_item_url(@purchase_order_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_purchase_order_item_url(@purchase_order_item)
    assert_response :success
  end

  test "should update purchase_order_item" do
    patch purchase_order_item_url(@purchase_order_item), params: { purchase_order_item: { amount: @purchase_order_item.amount, fiscal_year_id: @purchase_order_item.fiscal_year_id, fy: @purchase_order_item.fy, item_classification_no: @purchase_order_item.item_classification_no, name_of_item: @purchase_order_item.name_of_item, office_id: @purchase_order_item.office_id, purchase_order_id: @purchase_order_item.purchase_order_id, quantity: @purchase_order_item.quantity, rate: @purchase_order_item.rate, remarks: @purchase_order_item.remarks, specification: @purchase_order_item.specification, unit: @purchase_order_item.unit, user_id: @purchase_order_item.user_id } }
    assert_redirected_to purchase_order_item_url(@purchase_order_item)
  end

  test "should destroy purchase_order_item" do
    assert_difference('PurchaseOrderItem.count', -1) do
      delete purchase_order_item_url(@purchase_order_item)
    end

    assert_redirected_to purchase_order_items_url
  end
end
