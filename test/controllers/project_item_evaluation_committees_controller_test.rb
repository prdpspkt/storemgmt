require 'test_helper'

class ProjectItemEvaluationCommitteesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @project_item_evaluation_committee = project_item_evaluation_committees(:one)
  end

  test "should get index" do
    get project_item_evaluation_committees_url
    assert_response :success
  end

  test "should get new" do
    get new_project_item_evaluation_committee_url
    assert_response :success
  end

  test "should create project_item_evaluation_committee" do
    assert_difference('ProjectItemEvaluationCommittee.count') do
      post project_item_evaluation_committees_url, params: { project_item_evaluation_committee: { designation: @project_item_evaluation_committee.designation, fiscal_year_id: @project_item_evaluation_committee.fiscal_year_id, name: @project_item_evaluation_committee.name, office_id: @project_item_evaluation_committee.office_id, office_item_evaluation_id: @project_item_evaluation_committee.office_item_evaluation_id, user_id: @project_item_evaluation_committee.user_id } }
    end

    assert_redirected_to project_item_evaluation_committee_url(ProjectItemEvaluationCommittee.last)
  end

  test "should show project_item_evaluation_committee" do
    get project_item_evaluation_committee_url(@project_item_evaluation_committee)
    assert_response :success
  end

  test "should get edit" do
    get edit_project_item_evaluation_committee_url(@project_item_evaluation_committee)
    assert_response :success
  end

  test "should update project_item_evaluation_committee" do
    patch project_item_evaluation_committee_url(@project_item_evaluation_committee), params: { project_item_evaluation_committee: { designation: @project_item_evaluation_committee.designation, fiscal_year_id: @project_item_evaluation_committee.fiscal_year_id, name: @project_item_evaluation_committee.name, office_id: @project_item_evaluation_committee.office_id, office_item_evaluation_id: @project_item_evaluation_committee.office_item_evaluation_id, user_id: @project_item_evaluation_committee.user_id } }
    assert_redirected_to project_item_evaluation_committee_url(@project_item_evaluation_committee)
  end

  test "should destroy project_item_evaluation_committee" do
    assert_difference('ProjectItemEvaluationCommittee.count', -1) do
      delete project_item_evaluation_committee_url(@project_item_evaluation_committee)
    end

    assert_redirected_to project_item_evaluation_committees_url
  end
end
