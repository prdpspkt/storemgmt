require "application_system_test_case"

class ProjectMainExpensableItemRegisterRemsTest < ApplicationSystemTestCase
  setup do
    @project_main_expensable_item_register_rem = project_main_expensable_item_register_rems(:one)
  end

  test "visiting the index" do
    visit project_main_expensable_item_register_rems_url
    assert_selector "h1", text: "Project Main Expensable Item Register Rems"
  end

  test "creating a Project main expensable item register rem" do
    visit project_main_expensable_item_register_rems_url
    click_on "New Project Main Expensable Item Register Rem"

    fill_in "Amount", with: @project_main_expensable_item_register_rem.amount
    fill_in "Office item", with: @project_main_expensable_item_register_rem.office_item_id
    fill_in "Project main expensable item register transaction", with: @project_main_expensable_item_register_rem.project_main_expensable_item_register_transaction_id
    fill_in "Quantity", with: @project_main_expensable_item_register_rem.quantity
    click_on "Create Project main expensable item register rem"

    assert_text "Project main expensable item register rem was successfully created"
    click_on "Back"
  end

  test "updating a Project main expensable item register rem" do
    visit project_main_expensable_item_register_rems_url
    click_on "Edit", match: :first

    fill_in "Amount", with: @project_main_expensable_item_register_rem.amount
    fill_in "Office item", with: @project_main_expensable_item_register_rem.office_item_id
    fill_in "Project main expensable item register transaction", with: @project_main_expensable_item_register_rem.project_main_expensable_item_register_transaction_id
    fill_in "Quantity", with: @project_main_expensable_item_register_rem.quantity
    click_on "Update Project main expensable item register rem"

    assert_text "Project main expensable item register rem was successfully updated"
    click_on "Back"
  end

  test "destroying a Project main expensable item register rem" do
    visit project_main_expensable_item_register_rems_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Project main expensable item register rem was successfully destroyed"
  end
end
