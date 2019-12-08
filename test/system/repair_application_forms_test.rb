require "application_system_test_case"

class RepairApplicationFormsTest < ApplicationSystemTestCase
  setup do
    @repair_application_form = repair_application_forms(:one)
  end

  test "visiting the index" do
    visit repair_application_forms_url
    assert_selector "h1", text: "Repair Application Forms"
  end

  test "creating a Repair application form" do
    visit repair_application_forms_url
    click_on "New Repair Application Form"

    fill_in "Application no", with: @repair_application_form.application_no
    fill_in "Date", with: @repair_application_form.date
    fill_in "Fiscal year", with: @repair_application_form.fiscal_year_id
    fill_in "Fy", with: @repair_application_form.fy
    fill_in "Month", with: @repair_application_form.month
    fill_in "Office address", with: @repair_application_form.office_address
    fill_in "Office chief designation", with: @repair_application_form.office_chief_designation
    fill_in "Office chief name", with: @repair_application_form.office_chief_name
    fill_in "Office chief signed date", with: @repair_application_form.office_chief_signed_date
    fill_in "Office", with: @repair_application_form.office_id
    fill_in "Office name", with: @repair_application_form.office_name
    fill_in "Section chief designation", with: @repair_application_form.section_chief_designation
    fill_in "Section chief name", with: @repair_application_form.section_chief_name
    fill_in "Section chief signed date", with: @repair_application_form.section_chief_signed_date
    fill_in "Technical person designation", with: @repair_application_form.technical_person_designation
    fill_in "Technical person signed date", with: @repair_application_form.technical_person_signed_date
    fill_in "Tecnical person name", with: @repair_application_form.tecnical_person_name
    fill_in "User", with: @repair_application_form.user_id
    fill_in "Vendor address", with: @repair_application_form.vendor_address
    fill_in "Vendor name", with: @repair_application_form.vendor_name
    fill_in "Vendor pan", with: @repair_application_form.vendor_pan
    fill_in "Vendor phone", with: @repair_application_form.vendor_phone
    fill_in "Vendor registration no", with: @repair_application_form.vendor_registration_no
    fill_in "Within date", with: @repair_application_form.within_date
    fill_in "Year", with: @repair_application_form.year
    click_on "Create Repair application form"

    assert_text "Repair application form was successfully created"
    click_on "Back"
  end

  test "updating a Repair application form" do
    visit repair_application_forms_url
    click_on "Edit", match: :first

    fill_in "Application no", with: @repair_application_form.application_no
    fill_in "Date", with: @repair_application_form.date
    fill_in "Fiscal year", with: @repair_application_form.fiscal_year_id
    fill_in "Fy", with: @repair_application_form.fy
    fill_in "Month", with: @repair_application_form.month
    fill_in "Office address", with: @repair_application_form.office_address
    fill_in "Office chief designation", with: @repair_application_form.office_chief_designation
    fill_in "Office chief name", with: @repair_application_form.office_chief_name
    fill_in "Office chief signed date", with: @repair_application_form.office_chief_signed_date
    fill_in "Office", with: @repair_application_form.office_id
    fill_in "Office name", with: @repair_application_form.office_name
    fill_in "Section chief designation", with: @repair_application_form.section_chief_designation
    fill_in "Section chief name", with: @repair_application_form.section_chief_name
    fill_in "Section chief signed date", with: @repair_application_form.section_chief_signed_date
    fill_in "Technical person designation", with: @repair_application_form.technical_person_designation
    fill_in "Technical person signed date", with: @repair_application_form.technical_person_signed_date
    fill_in "Tecnical person name", with: @repair_application_form.tecnical_person_name
    fill_in "User", with: @repair_application_form.user_id
    fill_in "Vendor address", with: @repair_application_form.vendor_address
    fill_in "Vendor name", with: @repair_application_form.vendor_name
    fill_in "Vendor pan", with: @repair_application_form.vendor_pan
    fill_in "Vendor phone", with: @repair_application_form.vendor_phone
    fill_in "Vendor registration no", with: @repair_application_form.vendor_registration_no
    fill_in "Within date", with: @repair_application_form.within_date
    fill_in "Year", with: @repair_application_form.year
    click_on "Update Repair application form"

    assert_text "Repair application form was successfully updated"
    click_on "Back"
  end

  test "destroying a Repair application form" do
    visit repair_application_forms_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Repair application form was successfully destroyed"
  end
end
