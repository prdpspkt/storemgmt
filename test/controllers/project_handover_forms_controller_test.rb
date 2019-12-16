require 'test_helper'

class ProjectHandoverFormsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @project_handover_form = project_handover_forms(:one)
  end

  test "should get index" do
    get project_handover_forms_url
    assert_response :success
  end

  test "should get new" do
    get new_project_handover_form_url
    assert_response :success
  end

  test "should create project_handover_form" do
    assert_difference('ProjectHandoverForm.count') do
      post project_handover_forms_url, params: { project_handover_form: { date: @project_handover_form.date, decision_date: @project_handover_form.decision_date, decision_no: @project_handover_form.decision_no, fiscal_year_id: @project_handover_form.fiscal_year_id, form_no: @project_handover_form.form_no, fy: @project_handover_form.fy, handovered_project_name: @project_handover_form.handovered_project_name, marked_as_final: @project_handover_form.marked_as_final, office_chief_designation: @project_handover_form.office_chief_designation, office_chief_name: @project_handover_form.office_chief_name, office_chief_signed_date: @project_handover_form.office_chief_signed_date, office_id: @project_handover_form.office_id, store_chief_designation: @project_handover_form.store_chief_designation, store_chief_name: @project_handover_form.store_chief_name, store_chief_sign_date: @project_handover_form.store_chief_sign_date, user_id: @project_handover_form.user_id } }
    end

    assert_redirected_to project_handover_form_url(ProjectHandoverForm.last)
  end

  test "should show project_handover_form" do
    get project_handover_form_url(@project_handover_form)
    assert_response :success
  end

  test "should get edit" do
    get edit_project_handover_form_url(@project_handover_form)
    assert_response :success
  end

  test "should update project_handover_form" do
    patch project_handover_form_url(@project_handover_form), params: { project_handover_form: { date: @project_handover_form.date, decision_date: @project_handover_form.decision_date, decision_no: @project_handover_form.decision_no, fiscal_year_id: @project_handover_form.fiscal_year_id, form_no: @project_handover_form.form_no, fy: @project_handover_form.fy, handovered_project_name: @project_handover_form.handovered_project_name, marked_as_final: @project_handover_form.marked_as_final, office_chief_designation: @project_handover_form.office_chief_designation, office_chief_name: @project_handover_form.office_chief_name, office_chief_signed_date: @project_handover_form.office_chief_signed_date, office_id: @project_handover_form.office_id, store_chief_designation: @project_handover_form.store_chief_designation, store_chief_name: @project_handover_form.store_chief_name, store_chief_sign_date: @project_handover_form.store_chief_sign_date, user_id: @project_handover_form.user_id } }
    assert_redirected_to project_handover_form_url(@project_handover_form)
  end

  test "should destroy project_handover_form" do
    assert_difference('ProjectHandoverForm.count', -1) do
      delete project_handover_form_url(@project_handover_form)
    end

    assert_redirected_to project_handover_forms_url
  end
end
