require 'test_helper'

class ProjectTenderBreakdownsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @project_tender_breakdown = project_tender_breakdowns(:one)
  end

  test "should get index" do
    get project_tender_breakdowns_url
    assert_response :success
  end

  test "should get new" do
    get new_project_tender_breakdown_url
    assert_response :success
  end

  test "should create project_tender_breakdown" do
    assert_difference('ProjectTenderBreakdown.count') do
      post project_tender_breakdowns_url, params: { project_tender_breakdown: { marked_as_final: @project_tender_breakdown.marked_as_final, office_id: @project_tender_breakdown.office_id, project_id: @project_tender_breakdown.project_id, project_name_en: @project_tender_breakdown.project_name_en, project_name_ne: @project_tender_breakdown.project_name_ne, project_tender_id: @project_tender_breakdown.project_tender_id, user_id: @project_tender_breakdown.user_id } }
    end

    assert_redirected_to project_tender_breakdown_url(ProjectTenderBreakdown.last)
  end

  test "should show project_tender_breakdown" do
    get project_tender_breakdown_url(@project_tender_breakdown)
    assert_response :success
  end

  test "should get edit" do
    get edit_project_tender_breakdown_url(@project_tender_breakdown)
    assert_response :success
  end

  test "should update project_tender_breakdown" do
    patch project_tender_breakdown_url(@project_tender_breakdown), params: { project_tender_breakdown: { marked_as_final: @project_tender_breakdown.marked_as_final, office_id: @project_tender_breakdown.office_id, project_id: @project_tender_breakdown.project_id, project_name_en: @project_tender_breakdown.project_name_en, project_name_ne: @project_tender_breakdown.project_name_ne, project_tender_id: @project_tender_breakdown.project_tender_id, user_id: @project_tender_breakdown.user_id } }
    assert_redirected_to project_tender_breakdown_url(@project_tender_breakdown)
  end

  test "should destroy project_tender_breakdown" do
    assert_difference('ProjectTenderBreakdown.count', -1) do
      delete project_tender_breakdown_url(@project_tender_breakdown)
    end

    assert_redirected_to project_tender_breakdowns_url
  end
end
