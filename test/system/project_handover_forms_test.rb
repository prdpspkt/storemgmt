require "application_system_test_case"

class ProjectHandoverFormsTest < ApplicationSystemTestCase
  setup do
    @project_handover_form = project_handover_forms(:one)
  end

  test "visiting the index" do
    visit project_handover_forms_url
    assert_selector "h1", text: "Project Handover Forms"
  end

  test "creating a Project handover form" do
    visit project_handover_forms_url
    click_on "New Project Handover Form"

    fill_in "Date", with: @project_handover_form.date
    fill_in "Decision date", with: @project_handover_form.decision_date
    fill_in "Decision no", with: @project_handover_form.decision_no
    fill_in "Fiscal year", with: @project_handover_form.fiscal_year_id
    fill_in "Form no", with: @project_handover_form.form_no
    fill_in "Fy", with: @project_handover_form.fy
    fill_in "Handovered project name", with: @project_handover_form.handovered_project_name
    check "Marked as final" if @project_handover_form.marked_as_final
    fill_in "Office chief designation", with: @project_handover_form.office_chief_designation
    fill_in "Office chief name", with: @project_handover_form.office_chief_name
    fill_in "Office chief signed date", with: @project_handover_form.office_chief_signed_date
    fill_in "Office", with: @project_handover_form.office_id
    fill_in "Store chief designation", with: @project_handover_form.store_chief_designation
    fill_in "Store chief name", with: @project_handover_form.store_chief_name
    fill_in "Store chief sign date", with: @project_handover_form.store_chief_sign_date
    fill_in "User", with: @project_handover_form.user_id
    click_on "Create Project handover form"

    assert_text "Project handover form was successfully created"
    click_on "Back"
  end

  test "updating a Project handover form" do
    visit project_handover_forms_url
    click_on "Edit", match: :first

    fill_in "Date", with: @project_handover_form.date
    fill_in "Decision date", with: @project_handover_form.decision_date
    fill_in "Decision no", with: @project_handover_form.decision_no
    fill_in "Fiscal year", with: @project_handover_form.fiscal_year_id
    fill_in "Form no", with: @project_handover_form.form_no
    fill_in "Fy", with: @project_handover_form.fy
    fill_in "Handovered project name", with: @project_handover_form.handovered_project_name
    check "Marked as final" if @project_handover_form.marked_as_final
    fill_in "Office chief designation", with: @project_handover_form.office_chief_designation
    fill_in "Office chief name", with: @project_handover_form.office_chief_name
    fill_in "Office chief signed date", with: @project_handover_form.office_chief_signed_date
    fill_in "Office", with: @project_handover_form.office_id
    fill_in "Store chief designation", with: @project_handover_form.store_chief_designation
    fill_in "Store chief name", with: @project_handover_form.store_chief_name
    fill_in "Store chief sign date", with: @project_handover_form.store_chief_sign_date
    fill_in "User", with: @project_handover_form.user_id
    click_on "Update Project handover form"

    assert_text "Project handover form was successfully updated"
    click_on "Back"
  end

  test "destroying a Project handover form" do
    visit project_handover_forms_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Project handover form was successfully destroyed"
  end
end
