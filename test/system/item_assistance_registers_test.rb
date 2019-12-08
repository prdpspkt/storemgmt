require "application_system_test_case"

class ItemAssistanceRegistersTest < ApplicationSystemTestCase
  setup do
    @item_assistance_register = item_assistance_registers(:one)
  end

  test "visiting the index" do
    visit item_assistance_registers_url
    assert_selector "h1", text: "Item Assistance Registers"
  end

  test "creating a Item assistance register" do
    visit item_assistance_registers_url
    click_on "New Item Assistance Register"

    fill_in "Fiscal year", with: @item_assistance_register.fiscal_year_id
    fill_in "Fy", with: @item_assistance_register.fy
    fill_in "Item", with: @item_assistance_register.item_id
    fill_in "Item register page no", with: @item_assistance_register.item_register_page_no
    fill_in "Name of item", with: @item_assistance_register.name_of_item
    fill_in "Office chief designation", with: @item_assistance_register.office_chief_designation
    fill_in "Office chief name", with: @item_assistance_register.office_chief_name
    fill_in "Office chief signed date", with: @item_assistance_register.office_chief_signed_date
    fill_in "Office", with: @item_assistance_register.office_id
    fill_in "Office item", with: @item_assistance_register.office_item_id
    fill_in "Register page no", with: @item_assistance_register.register_page_no
    fill_in "Store chief designation", with: @item_assistance_register.store_chief_designation
    fill_in "Store chief name", with: @item_assistance_register.store_chief_name
    fill_in "Store chief signed date", with: @item_assistance_register.store_chief_signed_date
    fill_in "Unit", with: @item_assistance_register.unit
    fill_in "User", with: @item_assistance_register.user_id
    click_on "Create Item assistance register"

    assert_text "Item assistance register was successfully created"
    click_on "Back"
  end

  test "updating a Item assistance register" do
    visit item_assistance_registers_url
    click_on "Edit", match: :first

    fill_in "Fiscal year", with: @item_assistance_register.fiscal_year_id
    fill_in "Fy", with: @item_assistance_register.fy
    fill_in "Item", with: @item_assistance_register.item_id
    fill_in "Item register page no", with: @item_assistance_register.item_register_page_no
    fill_in "Name of item", with: @item_assistance_register.name_of_item
    fill_in "Office chief designation", with: @item_assistance_register.office_chief_designation
    fill_in "Office chief name", with: @item_assistance_register.office_chief_name
    fill_in "Office chief signed date", with: @item_assistance_register.office_chief_signed_date
    fill_in "Office", with: @item_assistance_register.office_id
    fill_in "Office item", with: @item_assistance_register.office_item_id
    fill_in "Register page no", with: @item_assistance_register.register_page_no
    fill_in "Store chief designation", with: @item_assistance_register.store_chief_designation
    fill_in "Store chief name", with: @item_assistance_register.store_chief_name
    fill_in "Store chief signed date", with: @item_assistance_register.store_chief_signed_date
    fill_in "Unit", with: @item_assistance_register.unit
    fill_in "User", with: @item_assistance_register.user_id
    click_on "Update Item assistance register"

    assert_text "Item assistance register was successfully updated"
    click_on "Back"
  end

  test "destroying a Item assistance register" do
    visit item_assistance_registers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Item assistance register was successfully destroyed"
  end
end
