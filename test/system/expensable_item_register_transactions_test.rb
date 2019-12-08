require "application_system_test_case"

class ExpensableItemRegisterTransactionsTest < ApplicationSystemTestCase
  setup do
    @expensable_item_register_transaction = expensable_item_register_transactions(:one)
  end

  test "visiting the index" do
    visit expensable_item_register_transactions_url
    assert_selector "h1", text: "Expensable Item Register Transactions"
  end

  test "creating a Expensable item register transaction" do
    visit expensable_item_register_transactions_url
    click_on "New Expensable Item Register Transaction"

    fill_in "Amount", with: @expensable_item_register_transaction.amount
    fill_in "Date", with: @expensable_item_register_transaction.date
    fill_in "Entry release no", with: @expensable_item_register_transaction.entry_release_no
    fill_in "Fiscal year", with: @expensable_item_register_transaction.fiscal_year_id
    fill_in "Fy", with: @expensable_item_register_transaction.fy
    fill_in "Office", with: @expensable_item_register_transaction.office_id
    fill_in "Quantity", with: @expensable_item_register_transaction.quantity
    fill_in "Rate", with: @expensable_item_register_transaction.rate
    fill_in "Remarks", with: @expensable_item_register_transaction.remarks
    fill_in "Transaction type", with: @expensable_item_register_transaction.transaction_type
    fill_in "User", with: @expensable_item_register_transaction.user_id
    click_on "Create Expensable item register transaction"

    assert_text "Expensable item register transaction was successfully created"
    click_on "Back"
  end

  test "updating a Expensable item register transaction" do
    visit expensable_item_register_transactions_url
    click_on "Edit", match: :first

    fill_in "Amount", with: @expensable_item_register_transaction.amount
    fill_in "Date", with: @expensable_item_register_transaction.date
    fill_in "Entry release no", with: @expensable_item_register_transaction.entry_release_no
    fill_in "Fiscal year", with: @expensable_item_register_transaction.fiscal_year_id
    fill_in "Fy", with: @expensable_item_register_transaction.fy
    fill_in "Office", with: @expensable_item_register_transaction.office_id
    fill_in "Quantity", with: @expensable_item_register_transaction.quantity
    fill_in "Rate", with: @expensable_item_register_transaction.rate
    fill_in "Remarks", with: @expensable_item_register_transaction.remarks
    fill_in "Transaction type", with: @expensable_item_register_transaction.transaction_type
    fill_in "User", with: @expensable_item_register_transaction.user_id
    click_on "Update Expensable item register transaction"

    assert_text "Expensable item register transaction was successfully updated"
    click_on "Back"
  end

  test "destroying a Expensable item register transaction" do
    visit expensable_item_register_transactions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Expensable item register transaction was successfully destroyed"
  end
end
