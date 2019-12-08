require "application_system_test_case"

class ExpensableItemRegisterRemsTest < ApplicationSystemTestCase
  setup do
    @expensable_item_register_rem = expensable_item_register_rems(:one)
  end

  test "visiting the index" do
    visit expensable_item_register_rems_url
    assert_selector "h1", text: "Expensable Item Register Rems"
  end

  test "creating a Expensable item register rem" do
    visit expensable_item_register_rems_url
    click_on "New Expensable Item Register Rem"

    fill_in "Amount", with: @expensable_item_register_rem.amount
    fill_in "Office item", with: @expensable_item_register_rem.office_item_id
    fill_in "Quantity", with: @expensable_item_register_rem.quantity
    click_on "Create Expensable item register rem"

    assert_text "Expensable item register rem was successfully created"
    click_on "Back"
  end

  test "updating a Expensable item register rem" do
    visit expensable_item_register_rems_url
    click_on "Edit", match: :first

    fill_in "Amount", with: @expensable_item_register_rem.amount
    fill_in "Office item", with: @expensable_item_register_rem.office_item_id
    fill_in "Quantity", with: @expensable_item_register_rem.quantity
    click_on "Update Expensable item register rem"

    assert_text "Expensable item register rem was successfully updated"
    click_on "Back"
  end

  test "destroying a Expensable item register rem" do
    visit expensable_item_register_rems_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Expensable item register rem was successfully destroyed"
  end
end
