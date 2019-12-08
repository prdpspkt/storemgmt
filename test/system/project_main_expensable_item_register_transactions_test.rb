require "application_system_test_case"

class ProjectMainExpensableItemRegisterTransactionsTest < ApplicationSystemTestCase
  setup do
    @project_main_expensable_item_register_transaction = project_main_expensable_item_register_transactions(:one)
  end

  test "visiting the index" do
    visit project_main_expensable_item_register_transactions_url
    assert_selector "h1", text: "Project Main Expensable Item Register Transactions"
  end

  test "creating a Project main expensable item register transaction" do
    visit project_main_expensable_item_register_transactions_url
    click_on "New Project Main Expensable Item Register Transaction"

    fill_in "Amount", with: @project_main_expensable_item_register_transaction.amount
    fill_in "Date", with: @project_main_expensable_item_register_transaction.date
    fill_in "Entry release no", with: @project_main_expensable_item_register_transaction.entry_release_no
    fill_in "Fiscal year", with: @project_main_expensable_item_register_transaction.fiscal_year_id
    fill_in "Fy", with: @project_main_expensable_item_register_transaction.fy
    fill_in "Office", with: @project_main_expensable_item_register_transaction.office_id
    fill_in "Project", with: @project_main_expensable_item_register_transaction.project_id
    fill_in "Quantity", with: @project_main_expensable_item_register_transaction.quantity
    fill_in "Rate", with: @project_main_expensable_item_register_transaction.rate
    fill_in "Remarks", with: @project_main_expensable_item_register_transaction.remarks
    fill_in "Transaction type", with: @project_main_expensable_item_register_transaction.transaction_type
    fill_in "User", with: @project_main_expensable_item_register_transaction.user_id
    click_on "Create Project main expensable item register transaction"

    assert_text "Project main expensable item register transaction was successfully created"
    click_on "Back"
  end

  test "updating a Project main expensable item register transaction" do
    visit project_main_expensable_item_register_transactions_url
    click_on "Edit", match: :first

    fill_in "Amount", with: @project_main_expensable_item_register_transaction.amount
    fill_in "Date", with: @project_main_expensable_item_register_transaction.date
    fill_in "Entry release no", with: @project_main_expensable_item_register_transaction.entry_release_no
    fill_in "Fiscal year", with: @project_main_expensable_item_register_transaction.fiscal_year_id
    fill_in "Fy", with: @project_main_expensable_item_register_transaction.fy
    fill_in "Office", with: @project_main_expensable_item_register_transaction.office_id
    fill_in "Project", with: @project_main_expensable_item_register_transaction.project_id
    fill_in "Quantity", with: @project_main_expensable_item_register_transaction.quantity
    fill_in "Rate", with: @project_main_expensable_item_register_transaction.rate
    fill_in "Remarks", with: @project_main_expensable_item_register_transaction.remarks
    fill_in "Transaction type", with: @project_main_expensable_item_register_transaction.transaction_type
    fill_in "User", with: @project_main_expensable_item_register_transaction.user_id
    click_on "Update Project main expensable item register transaction"

    assert_text "Project main expensable item register transaction was successfully updated"
    click_on "Back"
  end

  test "destroying a Project main expensable item register transaction" do
    visit project_main_expensable_item_register_transactions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Project main expensable item register transaction was successfully destroyed"
  end
end
