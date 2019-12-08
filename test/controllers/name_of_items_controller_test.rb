require 'test_helper'

class NameOfItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @name_of_item = name_of_items(:one)
  end

  test "should get index" do
    get name_of_items_url
    assert_response :success
  end

  test "should get new" do
    get new_name_of_item_url
    assert_response :success
  end

  test "should create name_of_item" do
    assert_difference('NameOfItem.count') do
      post name_of_items_url, params: { name_of_item: { applicant_sign: @name_of_item.applicant_sign, approx_repair_cost: @name_of_item.approx_repair_cost, item_identification_no: @name_of_item.item_identification_no, office_id: @name_of_item.office_id, reason_toPrepair: @name_of_item.reason_toPrepair, remarks: @name_of_item.remarks, repair_application_form_id: @name_of_item.repair_application_form_id, user_id: @name_of_item.user_id } }
    end

    assert_redirected_to name_of_item_url(NameOfItem.last)
  end

  test "should show name_of_item" do
    get name_of_item_url(@name_of_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_name_of_item_url(@name_of_item)
    assert_response :success
  end

  test "should update name_of_item" do
    patch name_of_item_url(@name_of_item), params: { name_of_item: { applicant_sign: @name_of_item.applicant_sign, approx_repair_cost: @name_of_item.approx_repair_cost, item_identification_no: @name_of_item.item_identification_no, office_id: @name_of_item.office_id, reason_toPrepair: @name_of_item.reason_toPrepair, remarks: @name_of_item.remarks, repair_application_form_id: @name_of_item.repair_application_form_id, user_id: @name_of_item.user_id } }
    assert_redirected_to name_of_item_url(@name_of_item)
  end

  test "should destroy name_of_item" do
    assert_difference('NameOfItem.count', -1) do
      delete name_of_item_url(@name_of_item)
    end

    assert_redirected_to name_of_items_url
  end
end
