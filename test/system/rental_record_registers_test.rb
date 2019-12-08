require "application_system_test_case"

class RentalRecordRegistersTest < ApplicationSystemTestCase
  setup do
    @rental_record_register = rental_record_registers(:one)
  end

  test "visiting the index" do
    visit rental_record_registers_url
    assert_selector "h1", text: "Rental Record Registers"
  end

  test "creating a Rental record register" do
    visit rental_record_registers_url
    click_on "New Rental Record Register"

    fill_in "Fiscal year", with: @rental_record_register.fiscal_year_id
    fill_in "Fy", with: @rental_record_register.fy
    check "Is given in rent" if @rental_record_register.is_given_in_rent
    check "Is taken in rent" if @rental_record_register.is_taken_in_rent
    fill_in "Item classification no", with: @rental_record_register.item_classification_no
    fill_in "Item", with: @rental_record_register.item_id
    fill_in "Item identification no", with: @rental_record_register.item_identification_no
    fill_in "Item register page no", with: @rental_record_register.item_register_page_no
    fill_in "Model no", with: @rental_record_register.model_no
    fill_in "Name of item", with: @rental_record_register.name_of_item
    fill_in "Office chief designation", with: @rental_record_register.office_chief_designation
    fill_in "Office chief name", with: @rental_record_register.office_chief_name
    fill_in "Office chief signed date", with: @rental_record_register.office_chief_signed_date
    fill_in "Office", with: @rental_record_register.office_id
    fill_in "Sotre chief name", with: @rental_record_register.sotre_chief_name
    fill_in "Specification", with: @rental_record_register.specification
    fill_in "Store chief designation", with: @rental_record_register.store_chief_designation
    fill_in "Store chief signed date", with: @rental_record_register.store_chief_signed_date
    fill_in "Total price", with: @rental_record_register.total_price
    fill_in "User", with: @rental_record_register.user_id
    click_on "Create Rental record register"

    assert_text "Rental record register was successfully created"
    click_on "Back"
  end

  test "updating a Rental record register" do
    visit rental_record_registers_url
    click_on "Edit", match: :first

    fill_in "Fiscal year", with: @rental_record_register.fiscal_year_id
    fill_in "Fy", with: @rental_record_register.fy
    check "Is given in rent" if @rental_record_register.is_given_in_rent
    check "Is taken in rent" if @rental_record_register.is_taken_in_rent
    fill_in "Item classification no", with: @rental_record_register.item_classification_no
    fill_in "Item", with: @rental_record_register.item_id
    fill_in "Item identification no", with: @rental_record_register.item_identification_no
    fill_in "Item register page no", with: @rental_record_register.item_register_page_no
    fill_in "Model no", with: @rental_record_register.model_no
    fill_in "Name of item", with: @rental_record_register.name_of_item
    fill_in "Office chief designation", with: @rental_record_register.office_chief_designation
    fill_in "Office chief name", with: @rental_record_register.office_chief_name
    fill_in "Office chief signed date", with: @rental_record_register.office_chief_signed_date
    fill_in "Office", with: @rental_record_register.office_id
    fill_in "Sotre chief name", with: @rental_record_register.sotre_chief_name
    fill_in "Specification", with: @rental_record_register.specification
    fill_in "Store chief designation", with: @rental_record_register.store_chief_designation
    fill_in "Store chief signed date", with: @rental_record_register.store_chief_signed_date
    fill_in "Total price", with: @rental_record_register.total_price
    fill_in "User", with: @rental_record_register.user_id
    click_on "Update Rental record register"

    assert_text "Rental record register was successfully updated"
    click_on "Back"
  end

  test "destroying a Rental record register" do
    visit rental_record_registers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Rental record register was successfully destroyed"
  end
end
