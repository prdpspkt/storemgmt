require 'test_helper'

class OfficeReleaseItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @office_release_item = office_release_items(:one)
  end

  test "should get index" do
    get office_release_items_url
    assert_response :success
  end

  test "should get new" do
    get new_office_release_item_url
    assert_response :success
  end

  test "should create office_release_item" do
    assert_difference('OfficeReleaseItem.count') do
      post office_release_items_url, params: { office_release_item: { amount: @office_release_item.amount, code_no: @office_release_item.code_no, fiscal_year_id: @office_release_item.fiscal_year_id, item_register_page_no: @office_release_item.item_register_page_no, name_of_item: @office_release_item.name_of_item, office_id: @office_release_item.office_id, office_release_id: @office_release_item.office_release_id, quantity: @office_release_item.quantity, rate: @office_release_item.rate, remarks: @office_release_item.remarks, specification: @office_release_item.specification, unit: @office_release_item.unit, user_id: @office_release_item.user_id } }
    end

    assert_redirected_to office_release_item_url(OfficeReleaseItem.last)
  end

  test "should show office_release_item" do
    get office_release_item_url(@office_release_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_office_release_item_url(@office_release_item)
    assert_response :success
  end

  test "should update office_release_item" do
    patch office_release_item_url(@office_release_item), params: { office_release_item: { amount: @office_release_item.amount, code_no: @office_release_item.code_no, fiscal_year_id: @office_release_item.fiscal_year_id, item_register_page_no: @office_release_item.item_register_page_no, name_of_item: @office_release_item.name_of_item, office_id: @office_release_item.office_id, office_release_id: @office_release_item.office_release_id, quantity: @office_release_item.quantity, rate: @office_release_item.rate, remarks: @office_release_item.remarks, specification: @office_release_item.specification, unit: @office_release_item.unit, user_id: @office_release_item.user_id } }
    assert_redirected_to office_release_item_url(@office_release_item)
  end

  test "should destroy office_release_item" do
    assert_difference('OfficeReleaseItem.count', -1) do
      delete office_release_item_url(@office_release_item)
    end

    assert_redirected_to office_release_items_url
  end
end
