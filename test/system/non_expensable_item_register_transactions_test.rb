require "application_system_test_case"

class NonExpensableItemRegisterTransactionsTest < ApplicationSystemTestCase
  setup do
    @non_expensable_item_register_transaction = non_expensable_item_register_transactions(:one)
  end

  test "visiting the index" do
    visit non_expensable_item_register_transactions_url
    assert_selector "h1", text: "Non Expensable Item Register Transactions"
  end

  test "creating a Non expensable item register transaction" do
    visit non_expensable_item_register_transactions_url
    click_on "New Non Expensable Item Register Transaction"

    fill_in "Age", with: @non_expensable_item_register_transaction.age
    fill_in "Amount", with: @non_expensable_item_register_transaction.amount
    fill_in "Company or country", with: @non_expensable_item_register_transaction.company_or_country
    fill_in "Date", with: @non_expensable_item_register_transaction.date
    fill_in "Entry release no", with: @non_expensable_item_register_transaction.entry_release_no
    fill_in "Fiscal year", with: @non_expensable_item_register_transaction.fiscal_year_id
    fill_in "Fy", with: @non_expensable_item_register_transaction.fy
    fill_in "Item", with: @non_expensable_item_register_transaction.item_id
    fill_in "Item identification no", with: @non_expensable_item_register_transaction.item_identification_no
    fill_in "Model no", with: @non_expensable_item_register_transaction.model_no
    fill_in "Non expensable item register", with: @non_expensable_item_register_transaction.non_expensable_item_register_id
    fill_in "Office", with: @non_expensable_item_register_transaction.office_id
    fill_in "Quantity", with: @non_expensable_item_register_transaction.quantity
    fill_in "Rate", with: @non_expensable_item_register_transaction.rate
    fill_in "Size", with: @non_expensable_item_register_transaction.size
    fill_in "Source", with: @non_expensable_item_register_transaction.source
    fill_in "Specification", with: @non_expensable_item_register_transaction.specification
    fill_in "Transaction type", with: @non_expensable_item_register_transaction.transaction_type
    fill_in "User", with: @non_expensable_item_register_transaction.user_id
    click_on "Create Non expensable item register transaction"

    assert_text "Non expensable item register transaction was successfully created"
    click_on "Back"
  end

  test "updating a Non expensable item register transaction" do
    visit non_expensable_item_register_transactions_url
    click_on "Edit", match: :first

    fill_in "Age", with: @non_expensable_item_register_transaction.age
    fill_in "Amount", with: @non_expensable_item_register_transaction.amount
    fill_in "Company or country", with: @non_expensable_item_register_transaction.company_or_country
    fill_in "Date", with: @non_expensable_item_register_transaction.date
    fill_in "Entry release no", with: @non_expensable_item_register_transaction.entry_release_no
    fill_in "Fiscal year", with: @non_expensable_item_register_transaction.fiscal_year_id
    fill_in "Fy", with: @non_expensable_item_register_transaction.fy
    fill_in "Item", with: @non_expensable_item_register_transaction.item_id
    fill_in "Item identification no", with: @non_expensable_item_register_transaction.item_identification_no
    fill_in "Model no", with: @non_expensable_item_register_transaction.model_no
    fill_in "Non expensable item register", with: @non_expensable_item_register_transaction.non_expensable_item_register_id
    fill_in "Office", with: @non_expensable_item_register_transaction.office_id
    fill_in "Quantity", with: @non_expensable_item_register_transaction.quantity
    fill_in "Rate", with: @non_expensable_item_register_transaction.rate
    fill_in "Size", with: @non_expensable_item_register_transaction.size
    fill_in "Source", with: @non_expensable_item_register_transaction.source
    fill_in "Specification", with: @non_expensable_item_register_transaction.specification
    fill_in "Transaction type", with: @non_expensable_item_register_transaction.transaction_type
    fill_in "User", with: @non_expensable_item_register_transaction.user_id
    click_on "Update Non expensable item register transaction"

    assert_text "Non expensable item register transaction was successfully updated"
    click_on "Back"
  end

  test "destroying a Non expensable item register transaction" do
    visit non_expensable_item_register_transactions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Non expensable item register transaction was successfully destroyed"
  end
end
