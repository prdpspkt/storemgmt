require "application_system_test_case"

class ExpensableItemRegistersTest < ApplicationSystemTestCase
  setup do
    @expensable_item_register = expensable_item_registers(:one)
  end

  test "visiting the index" do
    visit expensable_item_registers_url
    assert_selector "h1", text: "Expensable Item Registers"
  end

  test "creating a Expensable item register" do
    visit expensable_item_registers_url
    click_on "New Expensable Item Register"

    fill_in "Fiscal year", with: @expensable_item_register.fiscal_year_id
    fill_in "Fy", with: @expensable_item_register.fy
    fill_in "Item classification no", with: @expensable_item_register.item_classification_no
    fill_in "Item register page no", with: @expensable_item_register.item_register_page_no
    fill_in "Name of item", with: @expensable_item_register.name_of_item
    fill_in "Office chief designation", with: @expensable_item_register.office_chief_designation
    fill_in "Office chief name", with: @expensable_item_register.office_chief_name
    fill_in "Office chief signed date", with: @expensable_item_register.office_chief_signed_date
    fill_in "Office", with: @expensable_item_register.office_id
    fill_in "Section chief designation", with: @expensable_item_register.section_chief_designation
    fill_in "Section chief name", with: @expensable_item_register.section_chief_name
    fill_in "Section chief signed date", with: @expensable_item_register.section_chief_signed_date
    fill_in "Specification", with: @expensable_item_register.specification
    fill_in "Store chief designation", with: @expensable_item_register.store_chief_designation
    fill_in "Store chief name", with: @expensable_item_register.store_chief_name
    fill_in "Store chief signed date", with: @expensable_item_register.store_chief_signed_date
    fill_in "Unit", with: @expensable_item_register.unit
    fill_in "User", with: @expensable_item_register.user_id
    click_on "Create Expensable item register"

    assert_text "Expensable item register was successfully created"
    click_on "Back"
  end

  test "updating a Expensable item register" do
    visit expensable_item_registers_url
    click_on "Edit", match: :first

    fill_in "Fiscal year", with: @expensable_item_register.fiscal_year_id
    fill_in "Fy", with: @expensable_item_register.fy
    fill_in "Item classification no", with: @expensable_item_register.item_classification_no
    fill_in "Item register page no", with: @expensable_item_register.item_register_page_no
    fill_in "Name of item", with: @expensable_item_register.name_of_item
    fill_in "Office chief designation", with: @expensable_item_register.office_chief_designation
    fill_in "Office chief name", with: @expensable_item_register.office_chief_name
    fill_in "Office chief signed date", with: @expensable_item_register.office_chief_signed_date
    fill_in "Office", with: @expensable_item_register.office_id
    fill_in "Section chief designation", with: @expensable_item_register.section_chief_designation
    fill_in "Section chief name", with: @expensable_item_register.section_chief_name
    fill_in "Section chief signed date", with: @expensable_item_register.section_chief_signed_date
    fill_in "Specification", with: @expensable_item_register.specification
    fill_in "Store chief designation", with: @expensable_item_register.store_chief_designation
    fill_in "Store chief name", with: @expensable_item_register.store_chief_name
    fill_in "Store chief signed date", with: @expensable_item_register.store_chief_signed_date
    fill_in "Unit", with: @expensable_item_register.unit
    fill_in "User", with: @expensable_item_register.user_id
    click_on "Update Expensable item register"

    assert_text "Expensable item register was successfully updated"
    click_on "Back"
  end

  test "destroying a Expensable item register" do
    visit expensable_item_registers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Expensable item register was successfully destroyed"
  end
end
