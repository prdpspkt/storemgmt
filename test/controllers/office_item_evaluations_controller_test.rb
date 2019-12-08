require 'test_helper'

class OfficeItemEvaluationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @office_item_evaluation = office_item_evaluations(:one)
  end

  test "should get index" do
    get office_item_evaluations_url
    assert_response :success
  end

  test "should get new" do
    get new_office_item_evaluation_url
    assert_response :success
  end

  test "should create office_item_evaluation" do
    assert_difference('OfficeItemEvaluation.count') do
      post office_item_evaluations_url, params: { office_item_evaluation: { committee_formation_date: @office_item_evaluation.committee_formation_date, fiscal_year_id: @office_item_evaluation.fiscal_year_id, fy: @office_item_evaluation.fy, office_code: @office_item_evaluation.office_code, office_id: @office_item_evaluation.office_id, report_submission_date: @office_item_evaluation.report_submission_date, user_id: @office_item_evaluation.user_id } }
    end

    assert_redirected_to office_item_evaluation_url(OfficeItemEvaluation.last)
  end

  test "should show office_item_evaluation" do
    get office_item_evaluation_url(@office_item_evaluation)
    assert_response :success
  end

  test "should get edit" do
    get edit_office_item_evaluation_url(@office_item_evaluation)
    assert_response :success
  end

  test "should update office_item_evaluation" do
    patch office_item_evaluation_url(@office_item_evaluation), params: { office_item_evaluation: { committee_formation_date: @office_item_evaluation.committee_formation_date, fiscal_year_id: @office_item_evaluation.fiscal_year_id, fy: @office_item_evaluation.fy, office_code: @office_item_evaluation.office_code, office_id: @office_item_evaluation.office_id, report_submission_date: @office_item_evaluation.report_submission_date, user_id: @office_item_evaluation.user_id } }
    assert_redirected_to office_item_evaluation_url(@office_item_evaluation)
  end

  test "should destroy office_item_evaluation" do
    assert_difference('OfficeItemEvaluation.count', -1) do
      delete office_item_evaluation_url(@office_item_evaluation)
    end

    assert_redirected_to office_item_evaluations_url
  end
end
