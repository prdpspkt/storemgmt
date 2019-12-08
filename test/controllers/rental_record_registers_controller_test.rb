require 'test_helper'

class RentalRecordRegistersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @rental_record_register = rental_record_registers(:one)
  end

  test "should get index" do
    get rental_record_registers_url
    assert_response :success
  end

  test "should get new" do
    get new_rental_record_register_url
    assert_response :success
  end

  test "should create rental_record_register" do
    assert_difference('RentalRecordRegister.count') do
      post rental_record_registers_url, params: { rental_record_register: { fiscal_year_id: @rental_record_register.fiscal_year_id, fy: @rental_record_register.fy, is_given_in_rent: @rental_record_register.is_given_in_rent, is_taken_in_rent: @rental_record_register.is_taken_in_rent, item_classification_no: @rental_record_register.item_classification_no, item_id: @rental_record_register.item_id, item_identification_no: @rental_record_register.item_identification_no, item_register_page_no: @rental_record_register.item_register_page_no, model_no: @rental_record_register.model_no, name_of_item: @rental_record_register.name_of_item, office_chief_designation: @rental_record_register.office_chief_designation, office_chief_name: @rental_record_register.office_chief_name, office_chief_signed_date: @rental_record_register.office_chief_signed_date, office_id: @rental_record_register.office_id, sotre_chief_name: @rental_record_register.sotre_chief_name, specification: @rental_record_register.specification, store_chief_designation: @rental_record_register.store_chief_designation, store_chief_signed_date: @rental_record_register.store_chief_signed_date, total_price: @rental_record_register.total_price, user_id: @rental_record_register.user_id } }
    end

    assert_redirected_to rental_record_register_url(RentalRecordRegister.last)
  end

  test "should show rental_record_register" do
    get rental_record_register_url(@rental_record_register)
    assert_response :success
  end

  test "should get edit" do
    get edit_rental_record_register_url(@rental_record_register)
    assert_response :success
  end

  test "should update rental_record_register" do
    patch rental_record_register_url(@rental_record_register), params: { rental_record_register: { fiscal_year_id: @rental_record_register.fiscal_year_id, fy: @rental_record_register.fy, is_given_in_rent: @rental_record_register.is_given_in_rent, is_taken_in_rent: @rental_record_register.is_taken_in_rent, item_classification_no: @rental_record_register.item_classification_no, item_id: @rental_record_register.item_id, item_identification_no: @rental_record_register.item_identification_no, item_register_page_no: @rental_record_register.item_register_page_no, model_no: @rental_record_register.model_no, name_of_item: @rental_record_register.name_of_item, office_chief_designation: @rental_record_register.office_chief_designation, office_chief_name: @rental_record_register.office_chief_name, office_chief_signed_date: @rental_record_register.office_chief_signed_date, office_id: @rental_record_register.office_id, sotre_chief_name: @rental_record_register.sotre_chief_name, specification: @rental_record_register.specification, store_chief_designation: @rental_record_register.store_chief_designation, store_chief_signed_date: @rental_record_register.store_chief_signed_date, total_price: @rental_record_register.total_price, user_id: @rental_record_register.user_id } }
    assert_redirected_to rental_record_register_url(@rental_record_register)
  end

  test "should destroy rental_record_register" do
    assert_difference('RentalRecordRegister.count', -1) do
      delete rental_record_register_url(@rental_record_register)
    end

    assert_redirected_to rental_record_registers_url
  end
end
