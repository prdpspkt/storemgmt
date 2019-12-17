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
    fill_in "Contractor", with: @project.contractor
    fill_in "Fiscal year", with: @project.fiscal_year_id
    fill_in "Name of committee representative", with: @project.name_of_committee_representative
    fill_in "Name of consumer committee", with: @project.name_of_consumer_committee
    fill_in "Name of contractor representative", with: @project.name_of_contractor_representative
    fill_in "Name of project en", with: @project.name_of_project_en
    fill_in "Name of project ne", with: @project.name_of_project_ne
    fill_in "Office", with: @project.office_id
    fill_in "Phone of committee representative", with: @project.phone_of_committee_representative
    fill_in "Phone of contrator representative", with: @project.phone_of_contrator_representative
    fill_in "Post of representative", with: @project.post_of_representative
    fill_in "Project status", with: @project.project_status
    fill_in "User", with: @project.user_id
    click_on "Create Project"

    assert_text "Project was successfully created"
    click_on "Back"
  end

  test "updating a Project" do
    visit projects_url
    click_on "Edit", match: :first

    fill_in "Address", with: @project.address
    fill_in "Contractor", with: @project.contractor
    fill_in "Fiscal year", with: @project.fiscal_year_id
    fill_in "Name of committee representative", with: @project.name_of_committee_representative
    fill_in "Name of consumer committee", with: @project.name_of_consumer_committee
    fill_in "Name of contractor representative", with: @project.name_of_contractor_representative
    fill_in "Name of project en", with: @project.name_of_project_en
    fill_in "Name of project ne", with: @project.name_of_project_ne
    fill_in "Office", with: @project.office_id
    fill_in "Phone of committee representative", with: @project.phone_of_committee_representative
    fill_in "Phone of contrator representative", with: @project.phone_of_contrator_representative
    fill_in "Post of representative", with: @project.post_of_representative
    fill_in "Project status", with: @project.project_status
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
