require 'test_helper'

class DemandItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @demand_item = demand_items(:one)
  end

  test "should get index" do
    get demand_items_url
    assert_response :success
  end

  test "should get new" do
    get new_demand_item_url
    assert_response :success
  end

  test "should create demand_item" do
    assert_difference('DemandItem.count') do
      post demand_items_url, params: { demand_item: { demand_id: @demand_item.demand_id, fiscal_year_id: @demand_item.fiscal_year_id, fy: @demand_item.fy, name_of_item: @demand_item.name_of_item, office_id: @demand_item.office_id, office_item_id: @demand_item.office_item_id, quantity: @demand_item.quantity, remark: @demand_item.remark, specification: @demand_item.specification, unit: @demand_item.unit, user_id: @demand_item.user_id } }
    end

    assert_redirected_to demand_item_url(DemandItem.last)
  end

  test "should show demand_item" do
    get demand_item_url(@demand_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_demand_item_url(@demand_item)
    assert_response :success
  end

  test "should update demand_item" do
    patch demand_item_url(@demand_item), params: { demand_item: { demand_id: @demand_item.demand_id, fiscal_year_id: @demand_item.fiscal_year_id, fy: @demand_item.fy, name_of_item: @demand_item.name_of_item, office_id: @demand_item.office_id, office_item_id: @demand_item.office_item_id, quantity: @demand_item.quantity, remark: @demand_item.remark, specification: @demand_item.specification, unit: @demand_item.unit, user_id: @demand_item.user_id } }
    assert_redirected_to demand_item_url(@demand_item)
  end

  test "should destroy demand_item" do
    assert_difference('DemandItem.count', -1) do
      delete demand_item_url(@demand_item)
    end

    assert_redirected_to demand_items_url
  end
end
