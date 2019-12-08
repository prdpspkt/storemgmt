require "application_system_test_case"

class RentalRecordRegisterItemsTest < ApplicationSystemTestCase
  setup do
    @rental_record_register_item = rental_record_register_items(:one)
  end

  test "visiting the index" do
    visit rental_record_register_items_url
    assert_selector "h1", text: "Rental Record Register Items"
  end

  test "creating a Rental record register item" do
    visit rental_record_register_items_url
    click_on "New Rental Record Register Item"

    fill_in "Address of vendor", with: @rental_record_register_item.address_of_vendor
    fill_in "Approval date", with: @rental_record_register_item.approval_date
    fill_in "Date", with: @rental_record_register_item.date
    fill_in "Duration", with: @rental_record_register_item.duration
    fill_in "End date", with: @rental_record_register_item.end_date
    fill_in "Fiscal year", with: @rental_record_register_item.fiscal_year_id
    fill_in "Fy", with: @rental_record_register_item.fy
    fill_in "Name of vendor", with: @rental_record_register_item.name_of_vendor
    fill_in "Office", with: @rental_record_register_item.office_id
    fill_in "Rate", with: @rental_record_register_item.rate
    fill_in "Receipt or voucher no", with: @rental_record_register_item.receipt_or_voucher_no
    fill_in "Remarks", with: @rental_record_register_item.remarks
    fill_in "Rental record register", with: @rental_record_register_item.rental_record_register_id
    fill_in "Returned date", with: @rental_record_register_item.returned_date
    fill_in "Start date", with: @rental_record_register_item.start_date
    fill_in "Total amount", with: @rental_record_register_item.total_amount
    fill_in "Unit", with: @rental_record_register_item.unit
    fill_in "User", with: @rental_record_register_item.user_id
    click_on "Create Rental record register item"

    assert_text "Rental record register item was successfully created"
    click_on "Back"
  end

  test "updating a Rental record register item" do
    visit rental_record_register_items_url
    click_on "Edit", match: :first

    fill_in "Address of vendor", with: @rental_record_register_item.address_of_vendor
    fill_in "Approval date", with: @rental_record_register_item.approval_date
    fill_in "Date", with: @rental_record_register_item.date
    fill_in "Duration", with: @rental_record_register_item.duration
    fill_in "End date", with: @rental_record_register_item.end_date
    fill_in "Fiscal year", with: @rental_record_register_item.fiscal_year_id
    fill_in "Fy", with: @rental_record_register_item.fy
    fill_in "Name of vendor", with: @rental_record_register_item.name_of_vendor
    fill_in "Office", with: @rental_record_register_item.office_id
    fill_in "Rate", with: @rental_record_register_item.rate
    fill_in "Receipt or voucher no", with: @rental_record_register_item.receipt_or_voucher_no
    fill_in "Remarks", with: @rental_record_register_item.remarks
    fill_in "Rental record register", with: @rental_record_register_item.rental_record_register_id
    fill_in "Returned date", with: @rental_record_register_item.returned_date
    fill_in "Start date", with: @rental_record_register_item.start_date
    fill_in "Total amount", with: @rental_record_register_item.total_amount
    fill_in "Unit", with: @rental_record_register_item.unit
    fill_in "User", with: @rental_record_register_item.user_id
    click_on "Update Rental record register item"

    assert_text "Rental record register item was successfully updated"
    click_on "Back"
  end

  test "destroying a Rental record register item" do
    visit rental_record_register_items_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Rental record register item was successfully destroyed"
  end
end
