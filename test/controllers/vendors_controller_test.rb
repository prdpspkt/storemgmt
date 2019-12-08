require 'test_helper'

class VendorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @vendor = vendors(:one)
  end

  test "should get index" do
    get vendors_url
    assert_response :success
  end

  test "should get new" do
    get new_vendor_url
    assert_response :success
  end

  test "should create vendor" do
    assert_difference('Vendor.count') do
      post vendors_url, params: { vendor: { fiscal_year_id: @vendor.fiscal_year_id, office_id: @vendor.office_id, user_id: @vendor.user_id, vendor_address: @vendor.vendor_address, vendor_email: @vendor.vendor_email, vendor_name: @vendor.vendor_name, vendor_pan: @vendor.vendor_pan, vendor_phone: @vendor.vendor_phone, vendor_registration: @vendor.vendor_registration, vendor_reprensentive: @vendor.vendor_reprensentive } }
    end

    assert_redirected_to vendor_url(Vendor.last)
  end

  test "should show vendor" do
    get vendor_url(@vendor)
    assert_response :success
  end

  test "should get edit" do
    get edit_vendor_url(@vendor)
    assert_response :success
  end

  test "should update vendor" do
    patch vendor_url(@vendor), params: { vendor: { fiscal_year_id: @vendor.fiscal_year_id, office_id: @vendor.office_id, user_id: @vendor.user_id, vendor_address: @vendor.vendor_address, vendor_email: @vendor.vendor_email, vendor_name: @vendor.vendor_name, vendor_pan: @vendor.vendor_pan, vendor_phone: @vendor.vendor_phone, vendor_registration: @vendor.vendor_registration, vendor_reprensentive: @vendor.vendor_reprensentive } }
    assert_redirected_to vendor_url(@vendor)
  end

  test "should destroy vendor" do
    assert_difference('Vendor.count', -1) do
      delete vendor_url(@vendor)
    end

    assert_redirected_to vendors_url
  end
end
