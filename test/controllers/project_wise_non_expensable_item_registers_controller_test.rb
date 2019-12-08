require 'test_helper'

class ProjectWiseNonExpensableItemRegistersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @project_wise_non_expensable_item_register = project_wise_non_expensable_item_registers(:one)
  end

  test "should get index" do
    get project_wise_non_expensable_item_registers_url
    assert_response :success
  end

  test "should get new" do
    get new_project_wise_non_expensable_item_register_url
    assert_response :success
  end

  test "should create project_wise_non_expensable_item_register" do
    assert_difference('ProjectWiseNonExpensableItemRegister.count') do
      post project_wise_non_expensable_item_registers_url, params: { project_wise_non_expensable_item_register: { fiscal_year_id: @project_wise_non_expensable_item_register.fiscal_year_id, fy: @project_wise_non_expensable_item_register.fy, item_classification_no: @project_wise_non_expensable_item_register.item_classification_no, item_identification_no: @project_wise_non_expensable_item_register.item_identification_no, item_register_page_no: @project_wise_non_expensable_item_register.item_register_page_no, model_no: @project_wise_non_expensable_item_register.model_no, name_of_item: @project_wise_non_expensable_item_register.name_of_item, office_chief_designation: @project_wise_non_expensable_item_register.office_chief_designation, office_chief_name: @project_wise_non_expensable_item_register.office_chief_name, office_chief_signed_date: @project_wise_non_expensable_item_register.office_chief_signed_date, office_id: @project_wise_non_expensable_item_register.office_id, project_id: @project_wise_non_expensable_item_register.project_id, project_item_id: @project_wise_non_expensable_item_register.project_item_id, section_chief_designation: @project_wise_non_expensable_item_register.section_chief_designation, section_chief_name: @project_wise_non_expensable_item_register.section_chief_name, section_chief_signed_date: @project_wise_non_expensable_item_register.section_chief_signed_date, specification: @project_wise_non_expensable_item_register.specification, store_chief_designation: @project_wise_non_expensable_item_register.store_chief_designation, store_chief_name: @project_wise_non_expensable_item_register.store_chief_name, store_chief_signed_date: @project_wise_non_expensable_item_register.store_chief_signed_date, unit: @project_wise_non_expensable_item_register.unit, user_id: @project_wise_non_expensable_item_register.user_id } }
    end

    assert_redirected_to project_wise_non_expensable_item_register_url(ProjectWiseNonExpensableItemRegister.last)
  end

  test "should show project_wise_non_expensable_item_register" do
    get project_wise_non_expensable_item_register_url(@project_wise_non_expensable_item_register)
    assert_response :success
  end

  test "should get edit" do
    get edit_project_wise_non_expensable_item_register_url(@project_wise_non_expensable_item_register)
    assert_response :success
  end

  test "should update project_wise_non_expensable_item_register" do
    patch project_wise_non_expensable_item_register_url(@project_wise_non_expensable_item_register), params: { project_wise_non_expensable_item_register: { fiscal_year_id: @project_wise_non_expensable_item_register.fiscal_year_id, fy: @project_wise_non_expensable_item_register.fy, item_classification_no: @project_wise_non_expensable_item_register.item_classification_no, item_identification_no: @project_wise_non_expensable_item_register.item_identification_no, item_register_page_no: @project_wise_non_expensable_item_register.item_register_page_no, model_no: @project_wise_non_expensable_item_register.model_no, name_of_item: @project_wise_non_expensable_item_register.name_of_item, office_chief_designation: @project_wise_non_expensable_item_register.office_chief_designation, office_chief_name: @project_wise_non_expensable_item_register.office_chief_name, office_chief_signed_date: @project_wise_non_expensable_item_register.office_chief_signed_date, office_id: @project_wise_non_expensable_item_register.office_id, project_id: @project_wise_non_expensable_item_register.project_id, project_item_id: @project_wise_non_expensable_item_register.project_item_id, section_chief_designation: @project_wise_non_expensable_item_register.section_chief_designation, section_chief_name: @project_wise_non_expensable_item_register.section_chief_name, section_chief_signed_date: @project_wise_non_expensable_item_register.section_chief_signed_date, specification: @project_wise_non_expensable_item_register.specification, store_chief_designation: @project_wise_non_expensable_item_register.store_chief_designation, store_chief_name: @project_wise_non_expensable_item_register.store_chief_name, store_chief_signed_date: @project_wise_non_expensable_item_register.store_chief_signed_date, unit: @project_wise_non_expensable_item_register.unit, user_id: @project_wise_non_expensable_item_register.user_id } }
    assert_redirected_to project_wise_non_expensable_item_register_url(@project_wise_non_expensable_item_register)
  end

  test "should destroy project_wise_non_expensable_item_register" do
    assert_difference('ProjectWiseNonExpensableItemRegister.count', -1) do
      delete project_wise_non_expensable_item_register_url(@project_wise_non_expensable_item_register)
    end

    assert_redirected_to project_wise_non_expensable_item_registers_url
  end
end
