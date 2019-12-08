require "application_system_test_case"

class NonExpensableItemRegisterRemsTest < ApplicationSystemTestCase
  setup do
    @non_expensable_item_register_rem = non_expensable_item_register_rems(:one)
  end

  test "visiting the index" do
    visit non_expensable_item_register_rems_url
    assert_selector "h1", text: "Non Expensable Item Register Rems"
  end

  test "creating a Non expensable item register rem" do
    visit non_expensable_item_register_rems_url
    click_on "New Non Expensable Item Register Rem"

    fill_in "Amount", with: @non_expensable_item_register_rem.amount
    fill_in "Fiscal year", with: @non_expensable_item_register_rem.fiscal_year_id
    fill_in "Fy", with: @non_expensable_item_register_rem.fy
    fill_in "Item", with: @non_expensable_item_register_rem.item_id
    fill_in "Office", with: @non_expensable_item_register_rem.office_id
    fill_in "Office item", with: @non_expensable_item_register_rem.office_item_id
    fill_in "Quantity", with: @non_expensable_item_register_rem.quantity
    fill_in "User", with: @non_expensable_item_register_rem.user_id
    click_on "Create Non expensable item register rem"

    assert_text "Non expensable item register rem was successfully created"
    click_on "Back"
  end

  test "updating a Non expensable item register rem" do
    visit non_expensable_item_register_rems_url
    click_on "Edit", match: :first

    fill_in "Amount", with: @non_expensable_item_register_rem.amount
    fill_in "Fiscal year", with: @non_expensable_item_register_rem.fiscal_year_id
    fill_in "Fy", with: @non_expensable_item_register_rem.fy
    fill_in "Item", with: @non_expensable_item_register_rem.item_id
    fill_in "Office", with: @non_expensable_item_register_rem.office_id
    fill_in "Office item", with: @non_expensable_item_register_rem.office_item_id
    fill_in "Quantity", with: @non_expensable_item_register_rem.quantity
    fill_in "User", with: @non_expensable_item_register_rem.user_id
    click_on "Update Non expensable item register rem"

    assert_text "Non expensable item register rem was successfully updated"
    click_on "Back"
  end

  test "destroying a Non expensable item register rem" do
    visit non_expensable_item_register_rems_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Non expensable item register rem was successfully destroyed"
  end
end
