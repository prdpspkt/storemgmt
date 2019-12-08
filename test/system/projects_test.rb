require "application_system_test_case"

class ProjectsTest < ApplicationSystemTestCase
  setup do
    @project = projects(:one)
  end

  test "visiting the index" do
    visit projects_url
    assert_selector "h1", text: "Projects"
  end

  test "creating a Project" do
    visit projects_url
    click_on "New Project"

    fill_in "Address", with: @project.address
    fill_in "Committee name", with: @project.committee_name
    fill_in "Fiscal year", with: @project.fiscal_year_id
    fill_in "Name en", with: @project.name_en
    fill_in "Name ne", with: @project.name_ne
    fill_in "Office", with: @project.office_id
    fill_in "Phone", with: @project.phone
    fill_in "President", with: @project.president
    fill_in "Started fy", with: @project.started_fy
    fill_in "User", with: @project.user_id
    click_on "Create Project"

    assert_text "Project was successfully created"
    click_on "Back"
  end

  test "updating a Project" do
    visit projects_url
    click_on "Edit", match: :first

    fill_in "Address", with: @project.address
    fill_in "Committee name", with: @project.committee_name
    fill_in "Fiscal year", with: @project.fiscal_year_id
    fill_in "Name en", with: @project.name_en
    fill_in "Name ne", with: @project.name_ne
    fill_in "Office", with: @project.office_id
    fill_in "Phone", with: @project.phone
    fill_in "President", with: @project.president
    fill_in "Started fy", with: @project.started_fy
    fill_in "User", with: @project.user_id
    click_on "Update Project"

    assert_text "Project was successfully updated"
    click_on "Back"
  end

  test "destroying a Project" do
    visit projects_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Project was successfully destroyed"
  end
end
