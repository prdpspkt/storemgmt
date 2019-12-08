require "application_system_test_case"

class HandoverFormsTest < ApplicationSystemTestCase
  setup do
    @handover_form = handover_forms(:one)
  end

  test "visiting the index" do
    visit handover_forms_url
    assert_selector "h1", text: "Handover Forms"
  end

  test "creating a Handover form" do
    visit handover_forms_url
    click_on "New Handover Form"

    fill_in "Date", with: @handover_form.date
    fill_in "Decision date", with: @handover_form.decision_date
    fill_in "Decision no", with: @handover_form.decision_no
    fill_in "Fiscal year", with: @handover_form.fiscal_year_id
    fill_in "Fy", with: @handover_form.fy
    fill_in "Handover chief designation", with: @handover_form.handover_chief_designation
    fill_in "Handover chief name", with: @handover_form.handover_chief_name
    fill_in "Handover chief signed date", with: @handover_form.handover_chief_signed_date
    fill_in "Handover form no", with: @handover_form.handover_form_no
    fill_in "Handover store chief designation", with: @handover_form.handover_store_chief_designation
    fill_in "Handover store chief name", with: @handover_form.handover_store_chief_name
    fill_in "Handover store chief signed date", with: @handover_form.handover_store_chief_signed_date
    fill_in "Handovered office name", with: @handover_form.handovered_office_name
    fill_in "Office", with: @handover_form.office_id
    fill_in "Receiver chief desination", with: @handover_form.receiver_chief_desination
    fill_in "Receiver chief name", with: @handover_form.receiver_chief_name
    fill_in "Receiver chief signed date", with: @handover_form.receiver_chief_signed_date
    fill_in "Receiver store chief designation", with: @handover_form.receiver_store_chief_designation
    fill_in "Receiver store chief name", with: @handover_form.receiver_store_chief_name
    fill_in "Receiver store chief signed date", with: @handover_form.receiver_store_chief_signed_date
    fill_in "User", with: @handover_form.user_id
    click_on "Create Handover form"

    assert_text "Handover form was successfully created"
    click_on "Back"
  end

  test "updating a Handover form" do
    visit handover_forms_url
    click_on "Edit", match: :first

    fill_in "Date", with: @handover_form.date
    fill_in "Decision date", with: @handover_form.decision_date
    fill_in "Decision no", with: @handover_form.decision_no
    fill_in "Fiscal year", with: @handover_form.fiscal_year_id
    fill_in "Fy", with: @handover_form.fy
    fill_in "Handover chief designation", with: @handover_form.handover_chief_designation
    fill_in "Handover chief name", with: @handover_form.handover_chief_name
    fill_in "Handover chief signed date", with: @handover_form.handover_chief_signed_date
    fill_in "Handover form no", with: @handover_form.handover_form_no
    fill_in "Handover store chief designation", with: @handover_form.handover_store_chief_designation
    fill_in "Handover store chief name", with: @handover_form.handover_store_chief_name
    fill_in "Handover store chief signed date", with: @handover_form.handover_store_chief_signed_date
    fill_in "Handovered office name", with: @handover_form.handovered_office_name
    fill_in "Office", with: @handover_form.office_id
    fill_in "Receiver chief desination", with: @handover_form.receiver_chief_desination
    fill_in "Receiver chief name", with: @handover_form.receiver_chief_name
    fill_in "Receiver chief signed date", with: @handover_form.receiver_chief_signed_date
    fill_in "Receiver store chief designation", with: @handover_form.receiver_store_chief_designation
    fill_in "Receiver store chief name", with: @handover_form.receiver_store_chief_name
    fill_in "Receiver store chief signed date", with: @handover_form.receiver_store_chief_signed_date
    fill_in "User", with: @handover_form.user_id
    click_on "Update Handover form"

    assert_text "Handover form was successfully updated"
    click_on "Back"
  end

  test "destroying a Handover form" do
    visit handover_forms_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Handover form was successfully destroyed"
  end
end
