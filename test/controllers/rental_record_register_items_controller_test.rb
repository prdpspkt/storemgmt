require 'test_helper'

class RentalRecordRegisterItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @rental_record_register_item = rental_record_register_items(:one)
  end

  test "should get index" do
    get rental_record_register_items_url
    assert_response :success
  end

  test "should get new" do
    get new_rental_record_register_item_url
    assert_response :success
  end

  test "should create rental_record_register_item" do
    assert_difference('RentalRecordRegisterItem.count') do
      post rental_record_register_items_url, params: { rental_record_register_item: { address_of_vendor: @rental_record_register_item.address_of_vendor, approval_date: @rental_record_register_item.approval_date, date: @rental_record_register_item.date, duration: @rental_record_register_item.duration, end_date: @rental_record_register_item.end_date, fiscal_year_id: @rental_record_register_item.fiscal_year_id, fy: @rental_record_register_item.fy, name_of_vendor: @rental_record_register_item.name_of_vendor, office_id: @rental_record_register_item.office_id, rate: @rental_record_register_item.rate, receipt_or_voucher_no: @rental_record_register_item.receipt_or_voucher_no, remarks: @rental_record_register_item.remarks, rental_record_register_id: @rental_record_register_item.rental_record_register_id, returned_date: @rental_record_register_item.returned_date, start_date: @rental_record_register_item.start_date, total_amount: @rental_record_register_item.total_amount, unit: @rental_record_register_item.unit, user_id: @rental_record_register_item.user_id } }
    end

    assert_redirected_to rental_record_register_item_url(RentalRecordRegisterItem.last)
  end

  test "should show rental_record_register_item" do
    get rental_record_register_item_url(@rental_record_register_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_rental_record_register_item_url(@rental_record_register_item)
    assert_response :success
  end

  test "should update rental_record_register_item" do
    patch rental_record_register_item_url(@rental_record_register_item), params: { rental_record_register_item: { address_of_vendor: @rental_record_register_item.address_of_vendor, approval_date: @rental_record_register_item.approval_date, date: @rental_record_register_item.date, duration: @rental_record_register_item.duration, end_date: @rental_record_register_item.end_date, fiscal_year_id: @rental_record_register_item.fiscal_year_id, fy: @rental_record_register_item.fy, name_of_vendor: @rental_record_register_item.name_of_vendor, office_id: @rental_record_register_item.office_id, rate: @rental_record_register_item.rate, receipt_or_voucher_no: @rental_record_register_item.receipt_or_voucher_no, remarks: @rental_record_register_item.remarks, rental_record_register_id: @rental_record_register_item.rental_record_register_id, returned_date: @rental_record_register_item.returned_date, start_date: @rental_record_register_item.start_date, total_amount: @rental_record_register_item.total_amount, unit: @rental_record_register_item.unit, user_id: @rental_record_register_item.user_id } }
    assert_redirected_to rental_record_register_item_url(@rental_record_register_item)
  end

  test "should destroy rental_record_register_item" do
    assert_difference('RentalRecordRegisterItem.count', -1) do
      delete rental_record_register_item_url(@rental_record_register_item)
    end

    assert_redirected_to rental_record_register_items_url
  end
end
