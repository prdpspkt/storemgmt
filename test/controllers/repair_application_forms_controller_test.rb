require 'test_helper'

class RepairApplicationFormsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @repair_application_form = repair_application_forms(:one)
  end

  test "should get index" do
    get repair_application_forms_url
    assert_response :success
  end

  test "should get new" do
    get new_repair_application_form_url
    assert_response :success
  end

  test "should create repair_application_form" do
    assert_difference('RepairApplicationForm.count') do
      post repair_application_forms_url, params: { repair_application_form: { application_no: @repair_application_form.application_no, date: @repair_application_form.date, fiscal_year_id: @repair_application_form.fiscal_year_id, fy: @repair_application_form.fy, month: @repair_application_form.month, office_address: @repair_application_form.office_address, office_chief_designation: @repair_application_form.office_chief_designation, office_chief_name: @repair_application_form.office_chief_name, office_chief_signed_date: @repair_application_form.office_chief_signed_date, office_id: @repair_application_form.office_id, office_name: @repair_application_form.office_name, section_chief_designation: @repair_application_form.section_chief_designation, section_chief_name: @repair_application_form.section_chief_name, section_chief_signed_date: @repair_application_form.section_chief_signed_date, technical_person_designation: @repair_application_form.technical_person_designation, technical_person_signed_date: @repair_application_form.technical_person_signed_date, tecnical_person_name: @repair_application_form.tecnical_person_name, user_id: @repair_application_form.user_id, vendor_address: @repair_application_form.vendor_address, vendor_name: @repair_application_form.vendor_name, vendor_pan: @repair_application_form.vendor_pan, vendor_phone: @repair_application_form.vendor_phone, vendor_registration_no: @repair_application_form.vendor_registration_no, within_date: @repair_application_form.within_date, year: @repair_application_form.year } }
    end

    assert_redirected_to repair_application_form_url(RepairApplicationForm.last)
  end

  test "should show repair_application_form" do
    get repair_application_form_url(@repair_application_form)
    assert_response :success
  end

  test "should get edit" do
    get edit_repair_application_form_url(@repair_application_form)
    assert_response :success
  end

  test "should update repair_application_form" do
    patch repair_application_form_url(@repair_application_form), params: { repair_application_form: { application_no: @repair_application_form.application_no, date: @repair_application_form.date, fiscal_year_id: @repair_application_form.fiscal_year_id, fy: @repair_application_form.fy, month: @repair_application_form.month, office_address: @repair_application_form.office_address, office_chief_designation: @repair_application_form.office_chief_designation, office_chief_name: @repair_application_form.office_chief_name, office_chief_signed_date: @repair_application_form.office_chief_signed_date, office_id: @repair_application_form.office_id, office_name: @repair_application_form.office_name, section_chief_designation: @repair_application_form.section_chief_designation, section_chief_name: @repair_application_form.section_chief_name, section_chief_signed_date: @repair_application_form.section_chief_signed_date, technical_person_designation: @repair_application_form.technical_person_designation, technical_person_signed_date: @repair_application_form.technical_person_signed_date, tecnical_person_name: @repair_application_form.tecnical_person_name, user_id: @repair_application_form.user_id, vendor_address: @repair_application_form.vendor_address, vendor_name: @repair_application_form.vendor_name, vendor_pan: @repair_application_form.vendor_pan, vendor_phone: @repair_application_form.vendor_phone, vendor_registration_no: @repair_application_form.vendor_registration_no, within_date: @repair_application_form.within_date, year: @repair_application_form.year } }
    assert_redirected_to repair_application_form_url(@repair_application_form)
  end

  test "should destroy repair_application_form" do
    assert_difference('RepairApplicationForm.count', -1) do
      delete repair_application_form_url(@repair_application_form)
    end

    assert_redirected_to repair_application_forms_url
  end
end
