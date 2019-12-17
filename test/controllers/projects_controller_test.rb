require 'test_helper'

class ProjectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @project = projects(:one)
  end

  test "should get index" do
    get projects_url
    assert_response :success
  end

  test "should get new" do
    get new_project_url
    assert_response :success
  end

  test "should create project" do
    assert_difference('Project.count') do
      post projects_url, params: { project: { address: @project.address, contractor: @project.contractor, fiscal_year_id: @project.fiscal_year_id, name_of_committee_representative: @project.name_of_committee_representative, name_of_consumer_committee: @project.name_of_consumer_committee, name_of_contractor_representative: @project.name_of_contractor_representative, name_of_project_en: @project.name_of_project_en, name_of_project_ne: @project.name_of_project_ne, office_id: @project.office_id, phone_of_committee_representative: @project.phone_of_committee_representative, phone_of_contrator_representative: @project.phone_of_contrator_representative, post_of_representative: @project.post_of_representative, project_status: @project.project_status, user_id: @project.user_id } }
    end

    assert_redirected_to project_url(Project.last)
  end

  test "should show project" do
    get project_url(@project)
    assert_response :success
  end

  test "should get edit" do
    get edit_project_url(@project)
    assert_response :success
  end

  test "should update project" do
    patch project_url(@project), params: { project: { address: @project.address, contractor: @project.contractor, fiscal_year_id: @project.fiscal_year_id, name_of_committee_representative: @project.name_of_committee_representative, name_of_consumer_committee: @project.name_of_consumer_committee, name_of_contractor_representative: @project.name_of_contractor_representative, name_of_project_en: @project.name_of_project_en, name_of_project_ne: @project.name_of_project_ne, office_id: @project.office_id, phone_of_committee_representative: @project.phone_of_committee_representative, phone_of_contrator_representative: @project.phone_of_contrator_representative, post_of_representative: @project.post_of_representative, project_status: @project.project_status, user_id: @project.user_id } }
    assert_redirected_to project_url(@project)
  end

  test "should destroy project" do
    assert_difference('Project.count', -1) do
      delete project_url(@project)
    end

    assert_redirected_to projects_url
  end
end
