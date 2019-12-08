require "application_system_test_case"

class NonExpensableItemRegistersTest < ApplicationSystemTestCase
  setup do
    @non_expensable_item_register = non_expensable_item_registers(:one)
  end

  test "visiting the index" do
    visit non_expensable_item_registers_url
    assert_selector "h1", text: "Non Expensable Item Registers"
  end

  test "creating a Non expensable item register" do
    visit non_expensable_item_registers_url
    click_on "New Non Expensable Item Register"

    fill_in "Fiscal year", with: @non_expensable_item_register.fiscal_year_id
    fill_in "Fy", with: @non_expensable_item_register.fy
    fill_in "Item classification no", with: @non_expensable_item_register.item_classification_no
    fill_in "Item identification no", with: @non_expensable_item_register.item_identification_no
    fill_in "Item register page no", with: @non_expensable_item_register.item_register_page_no
    fill_in "Model no", with: @non_expensable_item_register.model_no
    fill_in "Name of item", with: @non_expensable_item_register.name_of_item
    fill_in "Office chief designation", with: @non_expensable_item_register.office_chief_designation
    fill_in "Office chief name", with: @non_expensable_item_register.office_chief_name
    fill_in "Office chief signed date", with: @non_expensable_item_register.office_chief_signed_date
    fill_in "Office", with: @non_expensable_item_register.office_id
    fill_in "Section chief designation", with: @non_expensable_item_register.section_chief_designation
    fill_in "Section chief name", with: @non_expensable_item_register.section_chief_name
    fill_in "Section chief signed date", with: @non_expensable_item_register.section_chief_signed_date
    fill_in "Specification", with: @non_expensable_item_register.specification
    fill_in "Store chief designation", with: @non_expensable_item_register.store_chief_designation
    fill_in "Store chief name", with: @non_expensable_item_register.store_chief_name
    fill_in "Store chief signed date", with: @non_expensable_item_register.store_chief_signed_date
    fill_in "Unit", with: @non_expensable_item_register.unit
    fill_in "User", with: @non_expensable_item_register.user_id
    click_on "Create Non expensable item register"

    assert_text "Non expensable item register was successfully created"
    click_on "Back"
  end

  test "updating a Non expensable item register" do
    visit non_expensable_item_registers_url
    click_on "Edit", match: :first

    fill_in "Fiscal year", with: @non_expensable_item_register.fiscal_year_id
    fill_in "Fy", with: @non_expensable_item_register.fy
    fill_in "Item classification no", with: @non_expensable_item_register.item_classification_no
    fill_in "Item identification no", with: @non_expensable_item_register.item_identification_no
    fill_in "Item register page no", with: @non_expensable_item_register.item_register_page_no
    fill_in "Model no", with: @non_expensable_item_register.model_no
    fill_in "Name of item", with: @non_expensable_item_register.name_of_item
    fill_in "Office chief designation", with: @non_expensable_item_register.office_chief_designation
    fill_in "Office chief name", with: @non_expensable_item_register.office_chief_name
    fill_in "Office chief signed date", with: @non_expensable_item_register.office_chief_signed_date
    fill_in "Office", with: @non_expensable_item_register.office_id
    fill_in "Section chief designation", with: @non_expensable_item_register.section_chief_designation
    fill_in "Section chief name", with: @non_expensable_item_register.section_chief_name
    fill_in "Section chief signed date", with: @non_expensable_item_register.section_chief_signed_date
    fill_in "Specification", with: @non_expensable_item_register.specification
    fill_in "Store chief designation", with: @non_expensable_item_register.store_chief_designation
    fill_in "Store chief name", with: @non_expensable_item_register.store_chief_name
    fill_in "Store chief signed date", with: @non_expensable_item_register.store_chief_signed_date
    fill_in "Unit", with: @non_expensable_item_register.unit
    fill_in "User", with: @non_expensable_item_register.user_id
    click_on "Update Non expensable item register"

    assert_text "Non expensable item register was successfully updated"
    click_on "Back"
  end

  test "destroying a Non expensable item register" do
    visit non_expensable_item_registers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Non expensable item register was successfully destroyed"
  end
end
