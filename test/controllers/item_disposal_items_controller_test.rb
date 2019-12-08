require 'test_helper'

class ItemDisposalItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @item_disposal_item = item_disposal_items(:one)
  end

  test "should get index" do
    get item_disposal_items_url
    assert_response :success
  end

  test "should get new" do
    get new_item_disposal_item_url
    assert_response :success
  end

  test "should create item_disposal_item" do
    assert_difference('ItemDisposalItem.count') do
      post item_disposal_items_url, params: { item_disposal_item: { amount: @item_disposal_item.amount, current_marked_price: @item_disposal_item.current_marked_price, fiscal_year_id: @item_disposal_item.fiscal_year_id, fy: @item_disposal_item.fy, is_office_item: @item_disposal_item.is_office_item, is_project_item: @item_disposal_item.is_project_item, item_classification_no: @item_disposal_item.item_classification_no, item_id: @item_disposal_item.item_id, item_register_page_no: @item_disposal_item.item_register_page_no, office_id: @item_disposal_item.office_id, quantity: @item_disposal_item.quantity, reason_for_disposal: @item_disposal_item.reason_for_disposal, received_date: @item_disposal_item.received_date, remarks: @item_disposal_item.remarks, specification: @item_disposal_item.specification, used_year: @item_disposal_item.used_year, user_id: @item_disposal_item.user_id } }
    end

    assert_redirected_to item_disposal_item_url(ItemDisposalItem.last)
  end

  test "should show item_disposal_item" do
    get item_disposal_item_url(@item_disposal_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_item_disposal_item_url(@item_disposal_item)
    assert_response :success
  end

  test "should update item_disposal_item" do
    patch item_disposal_item_url(@item_disposal_item), params: { item_disposal_item: { amount: @item_disposal_item.amount, current_marked_price: @item_disposal_item.current_marked_price, fiscal_year_id: @item_disposal_item.fiscal_year_id, fy: @item_disposal_item.fy, is_office_item: @item_disposal_item.is_office_item, is_project_item: @item_disposal_item.is_project_item, item_classification_no: @item_disposal_item.item_classification_no, item_id: @item_disposal_item.item_id, item_register_page_no: @item_disposal_item.item_register_page_no, office_id: @item_disposal_item.office_id, quantity: @item_disposal_item.quantity, reason_for_disposal: @item_disposal_item.reason_for_disposal, received_date: @item_disposal_item.received_date, remarks: @item_disposal_item.remarks, specification: @item_disposal_item.specification, used_year: @item_disposal_item.used_year, user_id: @item_disposal_item.user_id } }
    assert_redirected_to item_disposal_item_url(@item_disposal_item)
  end

  test "should destroy item_disposal_item" do
    assert_difference('ItemDisposalItem.count', -1) do
      delete item_disposal_item_url(@item_disposal_item)
    end

    assert_redirected_to item_disposal_items_url
  end
end
