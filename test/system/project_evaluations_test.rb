require "application_system_test_case"

class ProjectEvaluationsTest < ApplicationSystemTestCase
  setup do
    @project_evaluation = project_evaluations(:one)
  end

  test "visiting the index" do
    visit project_evaluations_url
    assert_selector "h1", text: "Project Evaluations"
  end

  test "creating a Project evaluation" do
    visit project_evaluations_url
    click_on "New Project Evaluation"

    fill_in "Committee formation date", with: @project_evaluation.committee_formation_date
    fill_in "Fiscal year", with: @project_evaluation.fiscal_year_id
    fill_in "Fy", with: @project_evaluation.fy
    check "Marked as final" if @project_evaluation.marked_as_final
    fill_in "Office", with: @project_evaluation.office_id
    fill_in "Report submission date", with: @project_evaluation.report_submission_date
    fill_in "User", with: @project_evaluation.user_id
    click_on "Create Project evaluation"

    assert_text "Project evaluation was successfully created"
    click_on "Back"
  end

  test "updating a Project evaluation" do
    visit project_evaluations_url
    click_on "Edit", match: :first

    fill_in "Committee formation date", with: @project_evaluation.committee_formation_date
    fill_in "Fiscal year", with: @project_evaluation.fiscal_year_id
    fill_in "Fy", with: @project_evaluation.fy
    check "Marked as final" if @project_evaluation.marked_as_final
    fill_in "Office", with: @project_evaluation.office_id
    fill_in "Report submission date", with: @project_evaluation.report_submission_date
    fill_in "User", with: @project_evaluation.user_id
    click_on "Update Project evaluation"

    assert_text "Project evaluation was successfully updated"
    click_on "Back"
  end

  test "destroying a Project evaluation" do
    visit project_evaluations_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Project evaluation was successfully destroyed"
  end
end
