require 'test_helper'

class ProjectMainNonExpensableItemRegistersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @project_main_non_expensable_item_register = project_main_non_expensable_item_registers(:one)
  end

  test "should get index" do
    get project_main_non_expensable_item_registers_url
    assert_response :success
  end

  test "should get new" do
    get new_project_main_non_expensable_item_register_url
    assert_response :success
  end

  test "should create project_main_non_expensable_item_register" do
    assert_difference('ProjectMainNonExpensableItemRegister.count') do
      post project_main_non_expensable_item_registers_url, params: { project_main_non_expensable_item_register: { fiscal_year_id: @project_main_non_expensable_item_register.fiscal_year_id, fy: @project_main_non_expensable_item_register.fy, item_classification_no: @project_main_non_expensable_item_register.item_classification_no, item_identification_no: @project_main_non_expensable_item_register.item_identification_no, item_register_page_no: @project_main_non_expensable_item_register.item_register_page_no, model_no: @project_main_non_expensable_item_register.model_no, name_of_item: @project_main_non_expensable_item_register.name_of_item, office_chief_designation: @project_main_non_expensable_item_register.office_chief_designation, office_chief_name: @project_main_non_expensable_item_register.office_chief_name, office_chief_signed_date: @project_main_non_expensable_item_register.office_chief_signed_date, office_id: @project_main_non_expensable_item_register.office_id, section_chief_designation: @project_main_non_expensable_item_register.section_chief_designation, section_chief_name: @project_main_non_expensable_item_register.section_chief_name, section_chief_signed_date: @project_main_non_expensable_item_register.section_chief_signed_date, specification: @project_main_non_expensable_item_register.specification, store_chief_designation: @project_main_non_expensable_item_register.store_chief_designation, store_chief_name: @project_main_non_expensable_item_register.store_chief_name, store_chief_signed_date: @project_main_non_expensable_item_register.store_chief_signed_date, unit: @project_main_non_expensable_item_register.unit, user_id: @project_main_non_expensable_item_register.user_id } }
    end

    assert_redirected_to project_main_non_expensable_item_register_url(ProjectMainNonExpensableItemRegister.last)
  end

  test "should show project_main_non_expensable_item_register" do
    get project_main_non_expensable_item_register_url(@project_main_non_expensable_item_register)
    assert_response :success
  end

  test "should get edit" do
    get edit_project_main_non_expensable_item_register_url(@project_main_non_expensable_item_register)
    assert_response :success
  end

  test "should update project_main_non_expensable_item_register" do
    patch project_main_non_expensable_item_register_url(@project_main_non_expensable_item_register), params: { project_main_non_expensable_item_register: { fiscal_year_id: @project_main_non_expensable_item_register.fiscal_year_id, fy: @project_main_non_expensable_item_register.fy, item_classification_no: @project_main_non_expensable_item_register.item_classification_no, item_identification_no: @project_main_non_expensable_item_register.item_identification_no, item_register_page_no: @project_main_non_expensable_item_register.item_register_page_no, model_no: @project_main_non_expensable_item_register.model_no, name_of_item: @project_main_non_expensable_item_register.name_of_item, office_chief_designation: @project_main_non_expensable_item_register.office_chief_designation, office_chief_name: @project_main_non_expensable_item_register.office_chief_name, office_chief_signed_date: @project_main_non_expensable_item_register.office_chief_signed_date, office_id: @project_main_non_expensable_item_register.office_id, section_chief_designation: @project_main_non_expensable_item_register.section_chief_designation, section_chief_name: @project_main_non_expensable_item_register.section_chief_name, section_chief_signed_date: @project_main_non_expensable_item_register.section_chief_signed_date, specification: @project_main_non_expensable_item_register.specification, store_chief_designation: @project_main_non_expensable_item_register.store_chief_designation, store_chief_name: @project_main_non_expensable_item_register.store_chief_name, store_chief_signed_date: @project_main_non_expensable_item_register.store_chief_signed_date, unit: @project_main_non_expensable_item_register.unit, user_id: @project_main_non_expensable_item_register.user_id } }
    assert_redirected_to project_main_non_expensable_item_register_url(@project_main_non_expensable_item_register)
  end

  test "should destroy project_main_non_expensable_item_register" do
    assert_difference('ProjectMainNonExpensableItemRegister.count', -1) do
      delete project_main_non_expensable_item_register_url(@project_main_non_expensable_item_register)
    end

    assert_redirected_to project_main_non_expensable_item_registers_url
  end
end
