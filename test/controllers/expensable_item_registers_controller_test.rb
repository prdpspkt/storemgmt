require 'test_helper'

class ExpensableItemRegistersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @expensable_item_register = expensable_item_registers(:one)
  end

  test "should get index" do
    get expensable_item_registers_url
    assert_response :success
  end

  test "should get new" do
    get new_expensable_item_register_url
    assert_response :success
  end

  test "should create expensable_item_register" do
    assert_difference('ExpensableItemRegister.count') do
      post expensable_item_registers_url, params: { expensable_item_register: { fiscal_year_id: @expensable_item_register.fiscal_year_id, fy: @expensable_item_register.fy, item_classification_no: @expensable_item_register.item_classification_no, item_register_page_no: @expensable_item_register.item_register_page_no, name_of_item: @expensable_item_register.name_of_item, office_chief_designation: @expensable_item_register.office_chief_designation, office_chief_name: @expensable_item_register.office_chief_name, office_chief_signed_date: @expensable_item_register.office_chief_signed_date, office_id: @expensable_item_register.office_id, section_chief_designation: @expensable_item_register.section_chief_designation, section_chief_name: @expensable_item_register.section_chief_name, section_chief_signed_date: @expensable_item_register.section_chief_signed_date, specification: @expensable_item_register.specification, store_chief_designation: @expensable_item_register.store_chief_designation, store_chief_name: @expensable_item_register.store_chief_name, store_chief_signed_date: @expensable_item_register.store_chief_signed_date, unit: @expensable_item_register.unit, user_id: @expensable_item_register.user_id } }
    end

    assert_redirected_to expensable_item_register_url(ExpensableItemRegister.last)
  end

  test "should show expensable_item_register" do
    get expensable_item_register_url(@expensable_item_register)
    assert_response :success
  end

  test "should get edit" do
    get edit_expensable_item_register_url(@expensable_item_register)
    assert_response :success
  end

  test "should update expensable_item_register" do
    patch expensable_item_register_url(@expensable_item_register), params: { expensable_item_register: { fiscal_year_id: @expensable_item_register.fiscal_year_id, fy: @expensable_item_register.fy, item_classification_no: @expensable_item_register.item_classification_no, item_register_page_no: @expensable_item_register.item_register_page_no, name_of_item: @expensable_item_register.name_of_item, office_chief_designation: @expensable_item_register.office_chief_designation, office_chief_name: @expensable_item_register.office_chief_name, office_chief_signed_date: @expensable_item_register.office_chief_signed_date, office_id: @expensable_item_register.office_id, section_chief_designation: @expensable_item_register.section_chief_designation, section_chief_name: @expensable_item_register.section_chief_name, section_chief_signed_date: @expensable_item_register.section_chief_signed_date, specification: @expensable_item_register.specification, store_chief_designation: @expensable_item_register.store_chief_designation, store_chief_name: @expensable_item_register.store_chief_name, store_chief_signed_date: @expensable_item_register.store_chief_signed_date, unit: @expensable_item_register.unit, user_id: @expensable_item_register.user_id } }
    assert_redirected_to expensable_item_register_url(@expensable_item_register)
  end

  test "should destroy expensable_item_register" do
    assert_difference('ExpensableItemRegister.count', -1) do
      delete expensable_item_register_url(@expensable_item_register)
    end

    assert_redirected_to expensable_item_registers_url
  end
end
