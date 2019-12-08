require 'test_helper'

class HandoverFormItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @handover_form_item = handover_form_items(:one)
  end

  test "should get index" do
    get handover_form_items_url
    assert_response :success
  end

  test "should get new" do
    get new_handover_form_item_url
    assert_response :success
  end

  test "should create handover_form_item" do
    assert_difference('HandoverFormItem.count') do
      post handover_form_items_url, params: { handover_form_item: { amount: @handover_form_item.amount, fiscal_year_id: @handover_form_item.fiscal_year_id, fy: @handover_form_item.fy, handover_form_id: @handover_form_item.handover_form_id, item_classification_no: @handover_form_item.item_classification_no, item_identification_no: @handover_form_item.item_identification_no, item_register_page_no: @handover_form_item.item_register_page_no, model_no: @handover_form_item.model_no, name_of_item: @handover_form_item.name_of_item, office_id: @handover_form_item.office_id, physical_status: @handover_form_item.physical_status, project_id: @handover_form_item.project_id, quantity: @handover_form_item.quantity, received_date: @handover_form_item.received_date, specification: @handover_form_item.specification, unit: @handover_form_item.unit, user_id: @handover_form_item.user_id } }
    end

    assert_redirected_to handover_form_item_url(HandoverFormItem.last)
  end

  test "should show handover_form_item" do
    get handover_form_item_url(@handover_form_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_handover_form_item_url(@handover_form_item)
    assert_response :success
  end

  test "should update handover_form_item" do
    patch handover_form_item_url(@handover_form_item), params: { handover_form_item: { amount: @handover_form_item.amount, fiscal_year_id: @handover_form_item.fiscal_year_id, fy: @handover_form_item.fy, handover_form_id: @handover_form_item.handover_form_id, item_classification_no: @handover_form_item.item_classification_no, item_identification_no: @handover_form_item.item_identification_no, item_register_page_no: @handover_form_item.item_register_page_no, model_no: @handover_form_item.model_no, name_of_item: @handover_form_item.name_of_item, office_id: @handover_form_item.office_id, physical_status: @handover_form_item.physical_status, project_id: @handover_form_item.project_id, quantity: @handover_form_item.quantity, received_date: @handover_form_item.received_date, specification: @handover_form_item.specification, unit: @handover_form_item.unit, user_id: @handover_form_item.user_id } }
    assert_redirected_to handover_form_item_url(@handover_form_item)
  end

  test "should destroy handover_form_item" do
    assert_difference('HandoverFormItem.count', -1) do
      delete handover_form_item_url(@handover_form_item)
    end

    assert_redirected_to handover_form_items_url
  end
end
