require 'test_helper'

class ProjectReleasesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @project_release = project_releases(:one)
  end

  test "should get index" do
    get project_releases_url
    assert_response :success
  end

  test "should get new" do
    get new_project_release_url
    assert_response :success
  end

  test "should create project_release" do
    assert_difference('ProjectRelease.count') do
      post project_releases_url, params: { project_release: { fiscal_year_id: @project_release.fiscal_year_id, fy: @project_release.fy, office_cheif_name: @project_release.office_cheif_name, office_cheif_signed_date: @project_release.office_cheif_signed_date, office_id: @project_release.office_id, project_id: @project_release.project_id, project_name: @project_release.project_name, release_date: @project_release.release_date, release_no: @project_release.release_no, store_chief_name: @project_release.store_chief_name, store_chief_signed_date: @project_release.store_chief_signed_date, user_id: @project_release.user_id } }
    end

    assert_redirected_to project_release_url(ProjectRelease.last)
  end

  test "should show project_release" do
    get project_release_url(@project_release)
    assert_response :success
  end

  test "should get edit" do
    get edit_project_release_url(@project_release)
    assert_response :success
  end

  test "should update project_release" do
    patch project_release_url(@project_release), params: { project_release: { fiscal_year_id: @project_release.fiscal_year_id, fy: @project_release.fy, office_cheif_name: @project_release.office_cheif_name, office_cheif_signed_date: @project_release.office_cheif_signed_date, office_id: @project_release.office_id, project_id: @project_release.project_id, project_name: @project_release.project_name, release_date: @project_release.release_date, release_no: @project_release.release_no, store_chief_name: @project_release.store_chief_name, store_chief_signed_date: @project_release.store_chief_signed_date, user_id: @project_release.user_id } }
    assert_redirected_to project_release_url(@project_release)
  end

  test "should destroy project_release" do
    assert_difference('ProjectRelease.count', -1) do
      delete project_release_url(@project_release)
    end

    assert_redirected_to project_releases_url
  end
end
