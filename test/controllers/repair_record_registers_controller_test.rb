require 'test_helper'

class RepairRecordRegistersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @repair_record_register = repair_record_registers(:one)
  end

  test "should get index" do
    get repair_record_registers_url
    assert_response :success
  end

  test "should get new" do
    get new_repair_record_register_url
    assert_response :success
  end

  test "should create repair_record_register" do
    assert_difference('RepairRecordRegister.count') do
      post repair_record_registers_url, params: { repair_record_register: { fiscal_year_id: @repair_record_register.fiscal_year_id, fy: @repair_record_register.fy, item_identification: @repair_record_register.item_identification, item_register_page_no: @repair_record_register.item_register_page_no, model: @repair_record_register.model, month: @repair_record_register.month, name_of_item: @repair_record_register.name_of_item, office_chief_designation: @repair_record_register.office_chief_designation, office_chief_name: @repair_record_register.office_chief_name, office_chief_signed_date: @repair_record_register.office_chief_signed_date, office_id: @repair_record_register.office_id, page_no: @repair_record_register.page_no, price: @repair_record_register.price, sotre_chief_designation: @repair_record_register.sotre_chief_designation, specificaiton: @repair_record_register.specificaiton, store_chief_name: @repair_record_register.store_chief_name, store_chief_signed_date: @repair_record_register.store_chief_signed_date, user_id: @repair_record_register.user_id, year: @repair_record_register.year } }
    end

    assert_redirected_to repair_record_register_url(RepairRecordRegister.last)
  end

  test "should show repair_record_register" do
    get repair_record_register_url(@repair_record_register)
    assert_response :success
  end

  test "should get edit" do
    get edit_repair_record_register_url(@repair_record_register)
    assert_response :success
  end

  test "should update repair_record_register" do
    patch repair_record_register_url(@repair_record_register), params: { repair_record_register: { fiscal_year_id: @repair_record_register.fiscal_year_id, fy: @repair_record_register.fy, item_identification: @repair_record_register.item_identification, item_register_page_no: @repair_record_register.item_register_page_no, model: @repair_record_register.model, month: @repair_record_register.month, name_of_item: @repair_record_register.name_of_item, office_chief_designation: @repair_record_register.office_chief_designation, office_chief_name: @repair_record_register.office_chief_name, office_chief_signed_date: @repair_record_register.office_chief_signed_date, office_id: @repair_record_register.office_id, page_no: @repair_record_register.page_no, price: @repair_record_register.price, sotre_chief_designation: @repair_record_register.sotre_chief_designation, specificaiton: @repair_record_register.specificaiton, store_chief_name: @repair_record_register.store_chief_name, store_chief_signed_date: @repair_record_register.store_chief_signed_date, user_id: @repair_record_register.user_id, year: @repair_record_register.year } }
    assert_redirected_to repair_record_register_url(@repair_record_register)
  end

  test "should destroy repair_record_register" do
    assert_difference('RepairRecordRegister.count', -1) do
      delete repair_record_register_url(@repair_record_register)
    end

    assert_redirected_to repair_record_registers_url
  end
end
