require "application_system_test_case"

class ProjectItemEvaluationCommitteesTest < ApplicationSystemTestCase
  setup do
    @project_item_evaluation_committee = project_item_evaluation_committees(:one)
  end

  test "visiting the index" do
    visit project_item_evaluation_committees_url
    assert_selector "h1", text: "Project Item Evaluation Committees"
  end

  test "creating a Project item evaluation committee" do
    visit project_item_evaluation_committees_url
    click_on "New Project Item Evaluation Committee"

    fill_in "Designation", with: @project_item_evaluation_committee.designation
    fill_in "Fiscal year", with: @project_item_evaluation_committee.fiscal_year_id
    fill_in "Name", with: @project_item_evaluation_committee.name
    fill_in "Office", with: @project_item_evaluation_committee.office_id
    fill_in "Office item evaluation", with: @project_item_evaluation_committee.office_item_evaluation_id
    fill_in "User", with: @project_item_evaluation_committee.user_id
    click_on "Create Project item evaluation committee"

    assert_text "Project item evaluation committee was successfully created"
    click_on "Back"
  end

  test "updating a Project item evaluation committee" do
    visit project_item_evaluation_committees_url
    click_on "Edit", match: :first

    fill_in "Designation", with: @project_item_evaluation_committee.designation
    fill_in "Fiscal year", with: @project_item_evaluation_committee.fiscal_year_id
    fill_in "Name", with: @project_item_evaluation_committee.name
    fill_in "Office", with: @project_item_evaluation_committee.office_id
    fill_in "Office item evaluation", with: @project_item_evaluation_committee.office_item_evaluation_id
    fill_in "User", with: @project_item_evaluation_committee.user_id
    click_on "Update Project item evaluation committee"

    assert_text "Project item evaluation committee was successfully updated"
    click_on "Back"
  end

  test "destroying a Project item evaluation committee" do
    visit project_item_evaluation_committees_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Project item evaluation committee was successfully destroyed"
  end
end
