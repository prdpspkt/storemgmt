require 'test_helper'

class RepairApplicationFormItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @repair_application_form_item = repair_application_form_items(:one)
  end

  test "should get index" do
    get repair_application_form_items_url
    assert_response :success
  end

  test "should get new" do
    get new_repair_application_form_item_url
    assert_response :success
  end

  test "should create repair_application_form_item" do
    assert_difference('RepairApplicationFormItem.count') do
      post repair_application_form_items_url, params: { repair_application_form_item: { applicant_sign: @repair_application_form_item.applicant_sign, approx_repair_cost: @repair_application_form_item.approx_repair_cost, item_identification_no: @repair_application_form_item.item_identification_no, name_of_item: @repair_application_form_item.name_of_item, office_id: @repair_application_form_item.office_id, reason_toPrepair: @repair_application_form_item.reason_toPrepair, remarks: @repair_application_form_item.remarks, repair_application_form_id: @repair_application_form_item.repair_application_form_id, user_id: @repair_application_form_item.user_id } }
    end

    assert_redirected_to repair_application_form_item_url(RepairApplicationFormItem.last)
  end

  test "should show repair_application_form_item" do
    get repair_application_form_item_url(@repair_application_form_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_repair_application_form_item_url(@repair_application_form_item)
    assert_response :success
  end

  test "should update repair_application_form_item" do
    patch repair_application_form_item_url(@repair_application_form_item), params: { repair_application_form_item: { applicant_sign: @repair_application_form_item.applicant_sign, approx_repair_cost: @repair_application_form_item.approx_repair_cost, item_identification_no: @repair_application_form_item.item_identification_no, name_of_item: @repair_application_form_item.name_of_item, office_id: @repair_application_form_item.office_id, reason_toPrepair: @repair_application_form_item.reason_toPrepair, remarks: @repair_application_form_item.remarks, repair_application_form_id: @repair_application_form_item.repair_application_form_id, user_id: @repair_application_form_item.user_id } }
    assert_redirected_to repair_application_form_item_url(@repair_application_form_item)
  end

  test "should destroy repair_application_form_item" do
    assert_difference('RepairApplicationFormItem.count', -1) do
      delete repair_application_form_item_url(@repair_application_form_item)
    end

    assert_redirected_to repair_application_form_items_url
  end
end
