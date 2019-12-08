require "application_system_test_case"

class OfficeItemEvaluationsTest < ApplicationSystemTestCase
  setup do
    @office_item_evaluation = office_item_evaluations(:one)
  end

  test "visiting the index" do
    visit office_item_evaluations_url
    assert_selector "h1", text: "Office Item Evaluations"
  end

  test "creating a Office item evaluation" do
    visit office_item_evaluations_url
    click_on "New Office Item Evaluation"

    fill_in "Committee formation date", with: @office_item_evaluation.committee_formation_date
    fill_in "Fiscal year", with: @office_item_evaluation.fiscal_year_id
    fill_in "Fy", with: @office_item_evaluation.fy
    fill_in "Office code", with: @office_item_evaluation.office_code
    fill_in "Office", with: @office_item_evaluation.office_id
    fill_in "Report submission date", with: @office_item_evaluation.report_submission_date
    fill_in "User", with: @office_item_evaluation.user_id
    click_on "Create Office item evaluation"

    assert_text "Office item evaluation was successfully created"
    click_on "Back"
  end

  test "updating a Office item evaluation" do
    visit office_item_evaluations_url
    click_on "Edit", match: :first

    fill_in "Committee formation date", with: @office_item_evaluation.committee_formation_date
    fill_in "Fiscal year", with: @office_item_evaluation.fiscal_year_id
    fill_in "Fy", with: @office_item_evaluation.fy
    fill_in "Office code", with: @office_item_evaluation.office_code
    fill_in "Office", with: @office_item_evaluation.office_id
    fill_in "Report submission date", with: @office_item_evaluation.report_submission_date
    fill_in "User", with: @office_item_evaluation.user_id
    click_on "Update Office item evaluation"

    assert_text "Office item evaluation was successfully updated"
    click_on "Back"
  end

  test "destroying a Office item evaluation" do
    visit office_item_evaluations_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Office item evaluation was successfully destroyed"
  end
end
