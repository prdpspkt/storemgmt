require 'test_helper'

class HandoverFormsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @handover_form = handover_forms(:one)
  end

  test "should get index" do
    get handover_forms_url
    assert_response :success
  end

  test "should get new" do
    get new_handover_form_url
    assert_response :success
  end

  test "should create handover_form" do
    assert_difference('HandoverForm.count') do
      post handover_forms_url, params: { handover_form: { date: @handover_form.date, decision_date: @handover_form.decision_date, decision_no: @handover_form.decision_no, fiscal_year_id: @handover_form.fiscal_year_id, fy: @handover_form.fy, handover_chief_designation: @handover_form.handover_chief_designation, handover_chief_name: @handover_form.handover_chief_name, handover_chief_signed_date: @handover_form.handover_chief_signed_date, handover_form_no: @handover_form.handover_form_no, handover_store_chief_designation: @handover_form.handover_store_chief_designation, handover_store_chief_name: @handover_form.handover_store_chief_name, handover_store_chief_signed_date: @handover_form.handover_store_chief_signed_date, handovered_office_name: @handover_form.handovered_office_name, office_id: @handover_form.office_id, receiver_chief_desination: @handover_form.receiver_chief_desination, receiver_chief_name: @handover_form.receiver_chief_name, receiver_chief_signed_date: @handover_form.receiver_chief_signed_date, receiver_store_chief_designation: @handover_form.receiver_store_chief_designation, receiver_store_chief_name: @handover_form.receiver_store_chief_name, receiver_store_chief_signed_date: @handover_form.receiver_store_chief_signed_date, user_id: @handover_form.user_id } }
    end

    assert_redirected_to handover_form_url(HandoverForm.last)
  end

  test "should show handover_form" do
    get handover_form_url(@handover_form)
    assert_response :success
  end

  test "should get edit" do
    get edit_handover_form_url(@handover_form)
    assert_response :success
  end

  test "should update handover_form" do
    patch handover_form_url(@handover_form), params: { handover_form: { date: @handover_form.date, decision_date: @handover_form.decision_date, decision_no: @handover_form.decision_no, fiscal_year_id: @handover_form.fiscal_year_id, fy: @handover_form.fy, handover_chief_designation: @handover_form.handover_chief_designation, handover_chief_name: @handover_form.handover_chief_name, handover_chief_signed_date: @handover_form.handover_chief_signed_date, handover_form_no: @handover_form.handover_form_no, handover_store_chief_designation: @handover_form.handover_store_chief_designation, handover_store_chief_name: @handover_form.handover_store_chief_name, handover_store_chief_signed_date: @handover_form.handover_store_chief_signed_date, handovered_office_name: @handover_form.handovered_office_name, office_id: @handover_form.office_id, receiver_chief_desination: @handover_form.receiver_chief_desination, receiver_chief_name: @handover_form.receiver_chief_name, receiver_chief_signed_date: @handover_form.receiver_chief_signed_date, receiver_store_chief_designation: @handover_form.receiver_store_chief_designation, receiver_store_chief_name: @handover_form.receiver_store_chief_name, receiver_store_chief_signed_date: @handover_form.receiver_store_chief_signed_date, user_id: @handover_form.user_id } }
    assert_redirected_to handover_form_url(@handover_form)
  end

  test "should destroy handover_form" do
    assert_difference('HandoverForm.count', -1) do
      delete handover_form_url(@handover_form)
    end

    assert_redirected_to handover_forms_url
  end
end
