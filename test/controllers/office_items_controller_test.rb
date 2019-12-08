require 'test_helper'

class OfficeItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @office_item = office_items(:one)
  end

  test "should get index" do
    get office_items_url
    assert_response :success
  end

  test "should get new" do
    get new_office_item_url
    assert_response :success
  end

  test "should create office_item" do
    assert_difference('OfficeItem.count') do
      post office_items_url, params: { office_item: { fy_id: @office_item.fy_id, item_id: @office_item.item_id, item_register_page_no: @office_item.item_register_page_no, name_of_item_en: @office_item.name_of_item_en, name_of_item_ne: @office_item.name_of_item_ne, not_working: @office_item.not_working, office_id: @office_item.office_id, to_be_auctioned: @office_item.to_be_auctioned, to_be_conserved: @office_item.to_be_conserved, to_be_repaired: @office_item.to_be_repaired, type: @office_item.type, unit_en: @office_item.unit_en, unit_ne: @office_item.unit_ne, user_id: @office_item.user_id, working: @office_item.working } }
    end

    assert_redirected_to office_item_url(OfficeItem.last)
  end

  test "should show office_item" do
    get office_item_url(@office_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_office_item_url(@office_item)
    assert_response :success
  end

  test "should update office_item" do
    patch office_item_url(@office_item), params: { office_item: { fy_id: @office_item.fy_id, item_id: @office_item.item_id, item_register_page_no: @office_item.item_register_page_no, name_of_item_en: @office_item.name_of_item_en, name_of_item_ne: @office_item.name_of_item_ne, not_working: @office_item.not_working, office_id: @office_item.office_id, to_be_auctioned: @office_item.to_be_auctioned, to_be_conserved: @office_item.to_be_conserved, to_be_repaired: @office_item.to_be_repaired, type: @office_item.type, unit_en: @office_item.unit_en, unit_ne: @office_item.unit_ne, user_id: @office_item.user_id, working: @office_item.working } }
    assert_redirected_to office_item_url(@office_item)
  end

  test "should destroy office_item" do
    assert_difference('OfficeItem.count', -1) do
      delete office_item_url(@office_item)
    end

    assert_redirected_to office_items_url
  end
end
