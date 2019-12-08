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
      post projects_url, params: { project: { address: @project.address, committee_name: @project.committee_name, fiscal_year_id: @project.fiscal_year_id, name_en: @project.name_en, name_ne: @project.name_ne, office_id: @project.office_id, phone: @project.phone, president: @project.president, started_fy: @project.started_fy, user_id: @project.user_id } }
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
    patch project_url(@project), params: { project: { address: @project.address, committee_name: @project.committee_name, fiscal_year_id: @project.fiscal_year_id, name_en: @project.name_en, name_ne: @project.name_ne, office_id: @project.office_id, phone: @project.phone, president: @project.president, started_fy: @project.started_fy, user_id: @project.user_id } }
    assert_redirected_to project_url(@project)
  end

  test "should destroy project" do
    assert_difference('Project.count', -1) do
      delete project_url(@project)
    end

    assert_redirected_to projects_url
  end
end
