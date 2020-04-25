require 'test_helper'

class Office::PoolItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @office_pool_item = office_pool_items(:one)
  end

  test "should get index" do
    get office_pool_items_url
    assert_response :success
  end

  test "should get new" do
    get new_office_pool_item_url
    assert_response :success
  end

  test "should create office_pool_item" do
    assert_difference('Office::PoolItem.count') do
      post office_pool_items_url, params: { office_pool_item: { item_category_id: @office_pool_item.item_category_id, name_of_item_en: @office_pool_item.name_of_item_en, name_of_item_ne: @office_pool_item.name_of_item_ne, unit_en: @office_pool_item.unit_en, unit_ne: @office_pool_item.unit_ne } }
    end

    assert_redirected_to office_pool_item_url(Office::PoolItem.last)
  end

  test "should show office_pool_item" do
    get office_pool_item_url(@office_pool_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_office_pool_item_url(@office_pool_item)
    assert_response :success
  end

  test "should update office_pool_item" do
    patch office_pool_item_url(@office_pool_item), params: { office_pool_item: { item_category_id: @office_pool_item.item_category_id, name_of_item_en: @office_pool_item.name_of_item_en, name_of_item_ne: @office_pool_item.name_of_item_ne, unit_en: @office_pool_item.unit_en, unit_ne: @office_pool_item.unit_ne } }
    assert_redirected_to office_pool_item_url(@office_pool_item)
  end

  test "should destroy office_pool_item" do
    assert_difference('Office::PoolItem.count', -1) do
      delete office_pool_item_url(@office_pool_item)
    end

    assert_redirected_to office_pool_items_url
  end
end
