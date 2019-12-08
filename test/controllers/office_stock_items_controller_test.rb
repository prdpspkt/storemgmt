require 'test_helper'

class OfficeStockItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @office_stock_item = office_stock_items(:one)
  end

  test "should get index" do
    get office_stock_items_url
    assert_response :success
  end

  test "should get new" do
    get new_office_stock_item_url
    assert_response :success
  end

  test "should create office_stock_item" do
    assert_difference('OfficeStockItem.count') do
      post office_stock_items_url, params: { office_stock_item: { amount: @office_stock_item.amount, fiscal_year_id: @office_stock_item.fiscal_year_id, item_classification_no: @office_stock_item.item_classification_no, item_register_page_no: @office_stock_item.item_register_page_no, name_of_item: @office_stock_item.name_of_item, office_id: @office_stock_item.office_id, office_item_id: @office_stock_item.office_item_id, physical_status: @office_stock_item.physical_status, quantity: @office_stock_item.quantity, rate: @office_stock_item.rate, remarks: @office_stock_item.remarks, unit: @office_stock_item.unit, user_id: @office_stock_item.user_id } }
    end

    assert_redirected_to office_stock_item_url(OfficeStockItem.last)
  end

  test "should show office_stock_item" do
    get office_stock_item_url(@office_stock_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_office_stock_item_url(@office_stock_item)
    assert_response :success
  end

  test "should update office_stock_item" do
    patch office_stock_item_url(@office_stock_item), params: { office_stock_item: { amount: @office_stock_item.amount, fiscal_year_id: @office_stock_item.fiscal_year_id, item_classification_no: @office_stock_item.item_classification_no, item_register_page_no: @office_stock_item.item_register_page_no, name_of_item: @office_stock_item.name_of_item, office_id: @office_stock_item.office_id, office_item_id: @office_stock_item.office_item_id, physical_status: @office_stock_item.physical_status, quantity: @office_stock_item.quantity, rate: @office_stock_item.rate, remarks: @office_stock_item.remarks, unit: @office_stock_item.unit, user_id: @office_stock_item.user_id } }
    assert_redirected_to office_stock_item_url(@office_stock_item)
  end

  test "should destroy office_stock_item" do
    assert_difference('OfficeStockItem.count', -1) do
      delete office_stock_item_url(@office_stock_item)
    end

    assert_redirected_to office_stock_items_url
  end
end
