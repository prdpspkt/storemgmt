require 'test_helper'

class ItemAssistanceRegisterItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @item_assistance_register_item = item_assistance_register_items(:one)
  end

  test "should get index" do
    get item_assistance_register_items_url
    assert_response :success
  end

  test "should get new" do
    get new_item_assistance_register_item_url
    assert_response :success
  end

  test "should create item_assistance_register_item" do
    assert_difference('ItemAssistanceRegisterItem.count') do
      post item_assistance_register_items_url, params: { item_assistance_register_item: { amount: @item_assistance_register_item.amount, date: @item_assistance_register_item.date, date_to_be_returned: @item_assistance_register_item.date_to_be_returned, fiscal_year_id: @item_assistance_register_item.fiscal_year_id, fy: @item_assistance_register_item.fy, item_identification_no: @item_assistance_register_item.item_identification_no, model_no: @item_assistance_register_item.model_no, name_of_item: @item_assistance_register_item.name_of_item, name_of_user: @item_assistance_register_item.name_of_user, office_id: @item_assistance_register_item.office_id, order_release_no: @item_assistance_register_item.order_release_no, quantity: @item_assistance_register_item.quantity, returned_date: @item_assistance_register_item.returned_date, returned_quantity: @item_assistance_register_item.returned_quantity, specification: @item_assistance_register_item.specification, taken_date: @item_assistance_register_item.taken_date, user_id: @item_assistance_register_item.user_id } }
    end

    assert_redirected_to item_assistance_register_item_url(ItemAssistanceRegisterItem.last)
  end

  test "should show item_assistance_register_item" do
    get item_assistance_register_item_url(@item_assistance_register_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_item_assistance_register_item_url(@item_assistance_register_item)
    assert_response :success
  end

  test "should update item_assistance_register_item" do
    patch item_assistance_register_item_url(@item_assistance_register_item), params: { item_assistance_register_item: { amount: @item_assistance_register_item.amount, date: @item_assistance_register_item.date, date_to_be_returned: @item_assistance_register_item.date_to_be_returned, fiscal_year_id: @item_assistance_register_item.fiscal_year_id, fy: @item_assistance_register_item.fy, item_identification_no: @item_assistance_register_item.item_identification_no, model_no: @item_assistance_register_item.model_no, name_of_item: @item_assistance_register_item.name_of_item, name_of_user: @item_assistance_register_item.name_of_user, office_id: @item_assistance_register_item.office_id, order_release_no: @item_assistance_register_item.order_release_no, quantity: @item_assistance_register_item.quantity, returned_date: @item_assistance_register_item.returned_date, returned_quantity: @item_assistance_register_item.returned_quantity, specification: @item_assistance_register_item.specification, taken_date: @item_assistance_register_item.taken_date, user_id: @item_assistance_register_item.user_id } }
    assert_redirected_to item_assistance_register_item_url(@item_assistance_register_item)
  end

  test "should destroy item_assistance_register_item" do
    assert_difference('ItemAssistanceRegisterItem.count', -1) do
      delete item_assistance_register_item_url(@item_assistance_register_item)
    end

    assert_redirected_to item_assistance_register_items_url
  end
end
