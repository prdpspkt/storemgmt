require 'test_helper'

class ProjectItemEvaluationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @project_item_evaluation = project_item_evaluations(:one)
  end

  test "should get index" do
    get project_item_evaluations_url
    assert_response :success
  end

  test "should get new" do
    get new_project_item_evaluation_url
    assert_response :success
  end

  test "should create project_item_evaluation" do
    assert_difference('ProjectItemEvaluation.count') do
      post project_item_evaluations_url, params: { project_item_evaluation: { committee_formation_date: @project_item_evaluation.committee_formation_date, fiscal_year_id: @project_item_evaluation.fiscal_year_id, fy: @project_item_evaluation.fy, office_code: @project_item_evaluation.office_code, office_id: @project_item_evaluation.office_id, report_submission_date: @project_item_evaluation.report_submission_date, user_id: @project_item_evaluation.user_id } }
    end

    assert_redirected_to project_item_evaluation_url(ProjectItemEvaluation.last)
  end

  test "should show project_item_evaluation" do
    get project_item_evaluation_url(@project_item_evaluation)
    assert_response :success
  end

  test "should get edit" do
    get edit_project_item_evaluation_url(@project_item_evaluation)
    assert_response :success
  end

  test "should update project_item_evaluation" do
    patch project_item_evaluation_url(@project_item_evaluation), params: { project_item_evaluation: { committee_formation_date: @project_item_evaluation.committee_formation_date, fiscal_year_id: @project_item_evaluation.fiscal_year_id, fy: @project_item_evaluation.fy, office_code: @project_item_evaluation.office_code, office_id: @project_item_evaluation.office_id, report_submission_date: @project_item_evaluation.report_submission_date, user_id: @project_item_evaluation.user_id } }
    assert_redirected_to project_item_evaluation_url(@project_item_evaluation)
  end

  test "should destroy project_item_evaluation" do
    assert_difference('ProjectItemEvaluation.count', -1) do
      delete project_item_evaluation_url(@project_item_evaluation)
    end

    assert_redirected_to project_item_evaluations_url
  end
end
