require 'test_helper'

class NonExpensableItemRegistersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @non_expensable_item_register = non_expensable_item_registers(:one)
  end

  test "should get index" do
    get non_expensable_item_registers_url
    assert_response :success
  end

  test "should get new" do
    get new_non_expensable_item_register_url
    assert_response :success
  end

  test "should create non_expensable_item_register" do
    assert_difference('NonExpensableItemRegister.count') do
      post non_expensable_item_registers_url, params: { non_expensable_item_register: { fiscal_year_id: @non_expensable_item_register.fiscal_year_id, fy: @non_expensable_item_register.fy, item_classification_no: @non_expensable_item_register.item_classification_no, item_identification_no: @non_expensable_item_register.item_identification_no, item_register_page_no: @non_expensable_item_register.item_register_page_no, model_no: @non_expensable_item_register.model_no, name_of_item: @non_expensable_item_register.name_of_item, office_chief_designation: @non_expensable_item_register.office_chief_designation, office_chief_name: @non_expensable_item_register.office_chief_name, office_chief_signed_date: @non_expensable_item_register.office_chief_signed_date, office_id: @non_expensable_item_register.office_id, section_chief_designation: @non_expensable_item_register.section_chief_designation, section_chief_name: @non_expensable_item_register.section_chief_name, section_chief_signed_date: @non_expensable_item_register.section_chief_signed_date, specification: @non_expensable_item_register.specification, store_chief_designation: @non_expensable_item_register.store_chief_designation, store_chief_name: @non_expensable_item_register.store_chief_name, store_chief_signed_date: @non_expensable_item_register.store_chief_signed_date, unit: @non_expensable_item_register.unit, user_id: @non_expensable_item_register.user_id } }
    end

    assert_redirected_to non_expensable_item_register_url(NonExpensableItemRegister.last)
  end

  test "should show non_expensable_item_register" do
    get non_expensable_item_register_url(@non_expensable_item_register)
    assert_response :success
  end

  test "should get edit" do
    get edit_non_expensable_item_register_url(@non_expensable_item_register)
    assert_response :success
  end

  test "should update non_expensable_item_register" do
    patch non_expensable_item_register_url(@non_expensable_item_register), params: { non_expensable_item_register: { fiscal_year_id: @non_expensable_item_register.fiscal_year_id, fy: @non_expensable_item_register.fy, item_classification_no: @non_expensable_item_register.item_classification_no, item_identification_no: @non_expensable_item_register.item_identification_no, item_register_page_no: @non_expensable_item_register.item_register_page_no, model_no: @non_expensable_item_register.model_no, name_of_item: @non_expensable_item_register.name_of_item, office_chief_designation: @non_expensable_item_register.office_chief_designation, office_chief_name: @non_expensable_item_register.office_chief_name, office_chief_signed_date: @non_expensable_item_register.office_chief_signed_date, office_id: @non_expensable_item_register.office_id, section_chief_designation: @non_expensable_item_register.section_chief_designation, section_chief_name: @non_expensable_item_register.section_chief_name, section_chief_signed_date: @non_expensable_item_register.section_chief_signed_date, specification: @non_expensable_item_register.specification, store_chief_designation: @non_expensable_item_register.store_chief_designation, store_chief_name: @non_expensable_item_register.store_chief_name, store_chief_signed_date: @non_expensable_item_register.store_chief_signed_date, unit: @non_expensable_item_register.unit, user_id: @non_expensable_item_register.user_id } }
    assert_redirected_to non_expensable_item_register_url(@non_expensable_item_register)
  end

  test "should destroy non_expensable_item_register" do
    assert_difference('NonExpensableItemRegister.count', -1) do
      delete non_expensable_item_register_url(@non_expensable_item_register)
    end

    assert_redirected_to non_expensable_item_registers_url
  end
end
