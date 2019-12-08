require 'test_helper'

class ItemAssistanceRegistersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @item_assistance_register = item_assistance_registers(:one)
  end

  test "should get index" do
    get item_assistance_registers_url
    assert_response :success
  end

  test "should get new" do
    get new_item_assistance_register_url
    assert_response :success
  end

  test "should create item_assistance_register" do
    assert_difference('ItemAssistanceRegister.count') do
      post item_assistance_registers_url, params: { item_assistance_register: { fiscal_year_id: @item_assistance_register.fiscal_year_id, fy: @item_assistance_register.fy, item_id: @item_assistance_register.item_id, item_register_page_no: @item_assistance_register.item_register_page_no, name_of_item: @item_assistance_register.name_of_item, office_chief_designation: @item_assistance_register.office_chief_designation, office_chief_name: @item_assistance_register.office_chief_name, office_chief_signed_date: @item_assistance_register.office_chief_signed_date, office_id: @item_assistance_register.office_id, office_item_id: @item_assistance_register.office_item_id, register_page_no: @item_assistance_register.register_page_no, store_chief_designation: @item_assistance_register.store_chief_designation, store_chief_name: @item_assistance_register.store_chief_name, store_chief_signed_date: @item_assistance_register.store_chief_signed_date, unit: @item_assistance_register.unit, user_id: @item_assistance_register.user_id } }
    end

    assert_redirected_to item_assistance_register_url(ItemAssistanceRegister.last)
  end

  test "should show item_assistance_register" do
    get item_assistance_register_url(@item_assistance_register)
    assert_response :success
  end

  test "should get edit" do
    get edit_item_assistance_register_url(@item_assistance_register)
    assert_response :success
  end

  test "should update item_assistance_register" do
    patch item_assistance_register_url(@item_assistance_register), params: { item_assistance_register: { fiscal_year_id: @item_assistance_register.fiscal_year_id, fy: @item_assistance_register.fy, item_id: @item_assistance_register.item_id, item_register_page_no: @item_assistance_register.item_register_page_no, name_of_item: @item_assistance_register.name_of_item, office_chief_designation: @item_assistance_register.office_chief_designation, office_chief_name: @item_assistance_register.office_chief_name, office_chief_signed_date: @item_assistance_register.office_chief_signed_date, office_id: @item_assistance_register.office_id, office_item_id: @item_assistance_register.office_item_id, register_page_no: @item_assistance_register.register_page_no, store_chief_designation: @item_assistance_register.store_chief_designation, store_chief_name: @item_assistance_register.store_chief_name, store_chief_signed_date: @item_assistance_register.store_chief_signed_date, unit: @item_assistance_register.unit, user_id: @item_assistance_register.user_id } }
    assert_redirected_to item_assistance_register_url(@item_assistance_register)
  end

  test "should destroy item_assistance_register" do
    assert_difference('ItemAssistanceRegister.count', -1) do
      delete item_assistance_register_url(@item_assistance_register)
    end

    assert_redirected_to item_assistance_registers_url
  end
end
