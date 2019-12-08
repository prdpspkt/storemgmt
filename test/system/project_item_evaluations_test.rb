require "application_system_test_case"

class ProjectItemEvaluationsTest < ApplicationSystemTestCase
  setup do
    @project_item_evaluation = project_item_evaluations(:one)
  end

  test "visiting the index" do
    visit project_item_evaluations_url
    assert_selector "h1", text: "Project Item Evaluations"
  end

  test "creating a Project item evaluation" do
    visit project_item_evaluations_url
    click_on "New Project Item Evaluation"

    fill_in "Committee formation date", with: @project_item_evaluation.committee_formation_date
    fill_in "Fiscal year", with: @project_item_evaluation.fiscal_year_id
    fill_in "Fy", with: @project_item_evaluation.fy
    fill_in "Office code", with: @project_item_evaluation.office_code
    fill_in "Office", with: @project_item_evaluation.office_id
    fill_in "Report submission date", with: @project_item_evaluation.report_submission_date
    fill_in "User", with: @project_item_evaluation.user_id
    click_on "Create Project item evaluation"

    assert_text "Project item evaluation was successfully created"
    click_on "Back"
  end

  test "updating a Project item evaluation" do
    visit project_item_evaluations_url
    click_on "Edit", match: :first

    fill_in "Committee formation date", with: @project_item_evaluation.committee_formation_date
    fill_in "Fiscal year", with: @project_item_evaluation.fiscal_year_id
    fill_in "Fy", with: @project_item_evaluation.fy
    fill_in "Office code", with: @project_item_evaluation.office_code
    fill_in "Office", with: @project_item_evaluation.office_id
    fill_in "Report submission date", with: @project_item_evaluation.report_submission_date
    fill_in "User", with: @project_item_evaluation.user_id
    click_on "Update Project item evaluation"

    assert_text "Project item evaluation was successfully updated"
    click_on "Back"
  end

  test "destroying a Project item evaluation" do
    visit project_item_evaluations_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Project item evaluation was successfully destroyed"
  end
end
