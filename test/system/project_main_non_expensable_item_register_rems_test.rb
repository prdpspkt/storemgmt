require "application_system_test_case"

class ProjectMainNonExpensableItemRegisterRemsTest < ApplicationSystemTestCase
  setup do
    @project_main_non_expensable_item_register_rem = project_main_non_expensable_item_register_rems(:one)
  end

  test "visiting the index" do
    visit project_main_non_expensable_item_register_rems_url
    assert_selector "h1", text: "Project Main Non Expensable Item Register Rems"
  end

  test "creating a Project main non expensable item register rem" do
    visit project_main_non_expensable_item_register_rems_url
    click_on "New Project Main Non Expensable Item Register Rem"

    fill_in "Amount", with: @project_main_non_expensable_item_register_rem.amount
    fill_in "Fiscal year", with: @project_main_non_expensable_item_register_rem.fiscal_year_id
    fill_in "Fy", with: @project_main_non_expensable_item_register_rem.fy
    fill_in "Item", with: @project_main_non_expensable_item_register_rem.item_id
    fill_in "Office", with: @project_main_non_expensable_item_register_rem.office_id
    fill_in "Project entry item", with: @project_main_non_expensable_item_register_rem.project_entry_item_id
    fill_in "Quantity", with: @project_main_non_expensable_item_register_rem.quantity
    fill_in "User", with: @project_main_non_expensable_item_register_rem.user_id
    click_on "Create Project main non expensable item register rem"

    assert_text "Project main non expensable item register rem was successfully created"
    click_on "Back"
  end

  test "updating a Project main non expensable item register rem" do
    visit project_main_non_expensable_item_register_rems_url
    click_on "Edit", match: :first

    fill_in "Amount", with: @project_main_non_expensable_item_register_rem.amount
    fill_in "Fiscal year", with: @project_main_non_expensable_item_register_rem.fiscal_year_id
    fill_in "Fy", with: @project_main_non_expensable_item_register_rem.fy
    fill_in "Item", with: @project_main_non_expensable_item_register_rem.item_id
    fill_in "Office", with: @project_main_non_expensable_item_register_rem.office_id
    fill_in "Project entry item", with: @project_main_non_expensable_item_register_rem.project_entry_item_id
    fill_in "Quantity", with: @project_main_non_expensable_item_register_rem.quantity
    fill_in "User", with: @project_main_non_expensable_item_register_rem.user_id
    click_on "Update Project main non expensable item register rem"

    assert_text "Project main non expensable item register rem was successfully updated"
    click_on "Back"
  end

  test "destroying a Project main non expensable item register rem" do
    visit project_main_non_expensable_item_register_rems_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Project main non expensable item register rem was successfully destroyed"
  end
end
