require "application_system_test_case"

class VendorsTest < ApplicationSystemTestCase
  setup do
    @vendor = vendors(:one)
  end

  test "visiting the index" do
    visit vendors_url
    assert_selector "h1", text: "Vendors"
  end

  test "creating a Vendor" do
    visit vendors_url
    click_on "New Vendor"

    fill_in "Fiscal year", with: @vendor.fiscal_year_id
    fill_in "Office", with: @vendor.office_id
    fill_in "User", with: @vendor.user_id
    fill_in "Vendor address", with: @vendor.vendor_address
    fill_in "Vendor email", with: @vendor.vendor_email
    fill_in "Vendor name", with: @vendor.vendor_name
    fill_in "Vendor pan", with: @vendor.vendor_pan
    fill_in "Vendor phone", with: @vendor.vendor_phone
    fill_in "Vendor registration", with: @vendor.vendor_registration
    fill_in "Vendor reprensentive", with: @vendor.vendor_reprensentive
    click_on "Create Vendor"

    assert_text "Vendor was successfully created"
    click_on "Back"
  end

  test "updating a Vendor" do
    visit vendors_url
    click_on "Edit", match: :first

    fill_in "Fiscal year", with: @vendor.fiscal_year_id
    fill_in "Office", with: @vendor.office_id
    fill_in "User", with: @vendor.user_id
    fill_in "Vendor address", with: @vendor.vendor_address
    fill_in "Vendor email", with: @vendor.vendor_email
    fill_in "Vendor name", with: @vendor.vendor_name
    fill_in "Vendor pan", with: @vendor.vendor_pan
    fill_in "Vendor phone", with: @vendor.vendor_phone
    fill_in "Vendor registration", with: @vendor.vendor_registration
    fill_in "Vendor reprensentive", with: @vendor.vendor_reprensentive
    click_on "Update Vendor"

    assert_text "Vendor was successfully updated"
    click_on "Back"
  end

  test "destroying a Vendor" do
    visit vendors_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Vendor was successfully destroyed"
  end
end
