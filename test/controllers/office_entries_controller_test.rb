require 'test_helper'

class OfficeEntriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @office_purchase_entry = office_entries(:one)
  end

  test "should get index" do
    get officePurchaseEntries_url
    assert_response :success
  end

  test "should get new" do
    get new_officePurchaseEntry_url
    assert_response :success
  end

  test "should create office_purchase_entry" do
    assert_difference('OfficePurchaseEntry.count') do
      post officePurchaseEntries_url, params: {office_purchase_entry: {entry_date: @office_purchase_entry.entry_date, entry_no: @office_purchase_entry.entry_no, fiscal_year_id: @office_purchase_entry.fiscal_year_id, fy: @office_purchase_entry.fy, office_chief_designation: @office_purchase_entry.office_chief_designation, office_chief_name: @office_purchase_entry.office_chief_name, office_chief_signed_date: @office_purchase_entry.office_chief_signed_date, office_id: @office_purchase_entry.office_id, section_chief_designation: @office_purchase_entry.section_chief_designation, section_chief_name: @office_purchase_entry.section_chief_name, section_chief_signed_date: @office_purchase_entry.section_chief_signed_date, store_cheif_sign_date: @office_purchase_entry.store_cheif_sign_date, store_chief_designation: @office_purchase_entry.store_chief_designation, store_chief_name: @office_purchase_entry.store_chief_name, user_id: @office_purchase_entry.user_id } }
    end

    assert_redirected_to officePurchaseEntry_url(OfficePurchaseEntry.last)
  end

  test "should show office_purchase_entry" do
    get officePurchaseEntry_url(@office_purchase_entry)
    assert_response :success
  end

  test "should get edit" do
    get edit_officePurchaseEntry_url(@office_purchase_entry)
    assert_response :success
  end

  test "should update office_purchase_entry" do
    patch officePurchaseEntry_url(@office_purchase_entry), params: {office_purchase_entry: {entry_date: @office_purchase_entry.entry_date, entry_no: @office_purchase_entry.entry_no, fiscal_year_id: @office_purchase_entry.fiscal_year_id, fy: @office_purchase_entry.fy, office_chief_designation: @office_purchase_entry.office_chief_designation, office_chief_name: @office_purchase_entry.office_chief_name, office_chief_signed_date: @office_purchase_entry.office_chief_signed_date, office_id: @office_purchase_entry.office_id, section_chief_designation: @office_purchase_entry.section_chief_designation, section_chief_name: @office_purchase_entry.section_chief_name, section_chief_signed_date: @office_purchase_entry.section_chief_signed_date, store_cheif_sign_date: @office_purchase_entry.store_cheif_sign_date, store_chief_designation: @office_purchase_entry.store_chief_designation, store_chief_name: @office_purchase_entry.store_chief_name, user_id: @office_purchase_entry.user_id } }
    assert_redirected_to officePurchaseEntry_url(@office_purchase_entry)
  end

  test "should destroy office_purchase_entry" do
    assert_difference('OfficePurchaseEntry.count', -1) do
      delete officePurchaseEntry_url(@office_purchase_entry)
    end

    assert_redirected_to officePurchaseEntries_url
  end
end
