require "application_system_test_case"

class ProjectWiseExpensableItemRegisterRemsTest < ApplicationSystemTestCase
  setup do
    @project_wise_expensable_item_register_rem = project_wise_expensable_item_register_rems(:one)
  end

  test "visiting the index" do
    visit project_wise_expensable_item_register_rems_url
    assert_selector "h1", text: "Project Wise Expensable Item Register Rems"
  end

  test "creating a Project wise expensable item register rem" do
    visit project_wise_expensable_item_register_rems_url
    click_on "New Project Wise Expensable Item Register Rem"

    fill_in "Amount", with: @project_wise_expensable_item_register_rem.amount
    fill_in "Office item", with: @project_wise_expensable_item_register_rem.office_item_id
    fill_in "Project wise expensable item register transaction", with: @project_wise_expensable_item_register_rem.project_wise_expensable_item_register_transaction_id
    fill_in "Quantity", with: @project_wise_expensable_item_register_rem.quantity
    click_on "Create Project wise expensable item register rem"

    assert_text "Project wise expensable item register rem was successfully created"
    click_on "Back"
  end

  test "updating a Project wise expensable item register rem" do
    visit project_wise_expensable_item_register_rems_url
    click_on "Edit", match: :first

    fill_in "Amount", with: @project_wise_expensable_item_register_rem.amount
    fill_in "Office item", with: @project_wise_expensable_item_register_rem.office_item_id
    fill_in "Project wise expensable item register transaction", with: @project_wise_expensable_item_register_rem.project_wise_expensable_item_register_transaction_id
    fill_in "Quantity", with: @project_wise_expensable_item_register_rem.quantity
    click_on "Update Project wise expensable item register rem"

    assert_text "Project wise expensable item register rem was successfully updated"
    click_on "Back"
  end

  test "destroying a Project wise expensable item register rem" do
    visit project_wise_expensable_item_register_rems_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Project wise expensable item register rem was successfully destroyed"
  end
end
