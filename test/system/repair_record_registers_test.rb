require "application_system_test_case"

class RepairRecordRegistersTest < ApplicationSystemTestCase
  setup do
    @repair_record_register = repair_record_registers(:one)
  end

  test "visiting the index" do
    visit repair_record_registers_url
    assert_selector "h1", text: "Repair Record Registers"
  end

  test "creating a Repair record register" do
    visit repair_record_registers_url
    click_on "New Repair Record Register"

    fill_in "Fiscal year", with: @repair_record_register.fiscal_year_id
    fill_in "Fy", with: @repair_record_register.fy
    fill_in "Item identification", with: @repair_record_register.item_identification
    fill_in "Item register page no", with: @repair_record_register.item_register_page_no
    fill_in "Model", with: @repair_record_register.model
    fill_in "Month", with: @repair_record_register.month
    fill_in "Name of item", with: @repair_record_register.name_of_item
    fill_in "Office chief designation", with: @repair_record_register.office_chief_designation
    fill_in "Office chief name", with: @repair_record_register.office_chief_name
    fill_in "Office chief signed date", with: @repair_record_register.office_chief_signed_date
    fill_in "Office", with: @repair_record_register.office_id
    fill_in "Page no", with: @repair_record_register.page_no
    fill_in "Price", with: @repair_record_register.price
    fill_in "Sotre chief designation", with: @repair_record_register.sotre_chief_designation
    fill_in "Specificaiton", with: @repair_record_register.specificaiton
    fill_in "Store chief name", with: @repair_record_register.store_chief_name
    fill_in "Store chief signed date", with: @repair_record_register.store_chief_signed_date
    fill_in "User", with: @repair_record_register.user_id
    fill_in "Year", with: @repair_record_register.year
    click_on "Create Repair record register"

    assert_text "Repair record register was successfully created"
    click_on "Back"
  end

  test "updating a Repair record register" do
    visit repair_record_registers_url
    click_on "Edit", match: :first

    fill_in "Fiscal year", with: @repair_record_register.fiscal_year_id
    fill_in "Fy", with: @repair_record_register.fy
    fill_in "Item identification", with: @repair_record_register.item_identification
    fill_in "Item register page no", with: @repair_record_register.item_register_page_no
    fill_in "Model", with: @repair_record_register.model
    fill_in "Month", with: @repair_record_register.month
    fill_in "Name of item", with: @repair_record_register.name_of_item
    fill_in "Office chief designation", with: @repair_record_register.office_chief_designation
    fill_in "Office chief name", with: @repair_record_register.office_chief_name
    fill_in "Office chief signed date", with: @repair_record_register.office_chief_signed_date
    fill_in "Office", with: @repair_record_register.office_id
    fill_in "Page no", with: @repair_record_register.page_no
    fill_in "Price", with: @repair_record_register.price
    fill_in "Sotre chief designation", with: @repair_record_register.sotre_chief_designation
    fill_in "Specificaiton", with: @repair_record_register.specificaiton
    fill_in "Store chief name", with: @repair_record_register.store_chief_name
    fill_in "Store chief signed date", with: @repair_record_register.store_chief_signed_date
    fill_in "User", with: @repair_record_register.user_id
    fill_in "Year", with: @repair_record_register.year
    click_on "Update Repair record register"

    assert_text "Repair record register was successfully updated"
    click_on "Back"
  end

  test "destroying a Repair record register" do
    visit repair_record_registers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Repair record register was successfully destroyed"
  end
end
