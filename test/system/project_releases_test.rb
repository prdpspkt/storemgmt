require "application_system_test_case"

class ProjectReleasesTest < ApplicationSystemTestCase
  setup do
    @project_release = project_releases(:one)
  end

  test "visiting the index" do
    visit project_releases_url
    assert_selector "h1", text: "Project Releases"
  end

  test "creating a Project release" do
    visit project_releases_url
    click_on "New Project Release"

    fill_in "Fiscal year", with: @project_release.fiscal_year_id
    fill_in "Fy", with: @project_release.fy
    fill_in "Office cheif name", with: @project_release.office_cheif_name
    fill_in "Office cheif signed date", with: @project_release.office_cheif_signed_date
    fill_in "Office", with: @project_release.office_id
    fill_in "Project", with: @project_release.project_id
    fill_in "Project name", with: @project_release.project_name
    fill_in "Release date", with: @project_release.release_date
    fill_in "Release no", with: @project_release.release_no
    fill_in "Store chief name", with: @project_release.store_chief_name
    fill_in "Store chief signed date", with: @project_release.store_chief_signed_date
    fill_in "User", with: @project_release.user_id
    click_on "Create Project release"

    assert_text "Project release was successfully created"
    click_on "Back"
  end

  test "updating a Project release" do
    visit project_releases_url
    click_on "Edit", match: :first

    fill_in "Fiscal year", with: @project_release.fiscal_year_id
    fill_in "Fy", with: @project_release.fy
    fill_in "Office cheif name", with: @project_release.office_cheif_name
    fill_in "Office cheif signed date", with: @project_release.office_cheif_signed_date
    fill_in "Office", with: @project_release.office_id
    fill_in "Project", with: @project_release.project_id
    fill_in "Project name", with: @project_release.project_name
    fill_in "Release date", with: @project_release.release_date
    fill_in "Release no", with: @project_release.release_no
    fill_in "Store chief name", with: @project_release.store_chief_name
    fill_in "Store chief signed date", with: @project_release.store_chief_signed_date
    fill_in "User", with: @project_release.user_id
    click_on "Update Project release"

    assert_text "Project release was successfully updated"
    click_on "Back"
  end

  test "destroying a Project release" do
    visit project_releases_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Project release was successfully destroyed"
  end
end
