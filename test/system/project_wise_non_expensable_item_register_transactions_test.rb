require "application_system_test_case"

class ProjectWiseNonExpensableItemRegisterTransactionsTest < ApplicationSystemTestCase
  setup do
    @project_wise_non_expensable_item_register_transaction = project_wise_non_expensable_item_register_transactions(:one)
  end

  test "visiting the index" do
    visit project_wise_non_expensable_item_register_transactions_url
    assert_selector "h1", text: "Project Wise Non Expensable Item Register Transactions"
  end

  test "creating a Project wise non expensable item register transaction" do
    visit project_wise_non_expensable_item_register_transactions_url
    click_on "New Project Wise Non Expensable Item Register Transaction"

    fill_in "Age", with: @project_wise_non_expensable_item_register_transaction.age
    fill_in "Amount", with: @project_wise_non_expensable_item_register_transaction.amount
    fill_in "Borrowed from", with: @project_wise_non_expensable_item_register_transaction.borrowed_from
    fill_in "Company or country", with: @project_wise_non_expensable_item_register_transaction.company_or_country
    fill_in "Date", with: @project_wise_non_expensable_item_register_transaction.date
    fill_in "Entry release no", with: @project_wise_non_expensable_item_register_transaction.entry_release_no
    fill_in "Fiscal year", with: @project_wise_non_expensable_item_register_transaction.fiscal_year_id
    fill_in "Fy", with: @project_wise_non_expensable_item_register_transaction.fy
    fill_in "Item", with: @project_wise_non_expensable_item_register_transaction.item_id
    fill_in "Item identification no", with: @project_wise_non_expensable_item_register_transaction.item_identification_no
    fill_in "Lended to", with: @project_wise_non_expensable_item_register_transaction.lended_to
    fill_in "Model no", with: @project_wise_non_expensable_item_register_transaction.model_no
    fill_in "Office", with: @project_wise_non_expensable_item_register_transaction.office_id
    fill_in "Project", with: @project_wise_non_expensable_item_register_transaction.project_id
    fill_in "Project item", with: @project_wise_non_expensable_item_register_transaction.project_item_id
    fill_in "Project main non expensable item register", with: @project_wise_non_expensable_item_register_transaction.project_main_non_expensable_item_register_id
    fill_in "Quantity", with: @project_wise_non_expensable_item_register_transaction.quantity
    fill_in "Rate", with: @project_wise_non_expensable_item_register_transaction.rate
    fill_in "Remarks", with: @project_wise_non_expensable_item_register_transaction.remarks
    fill_in "Size", with: @project_wise_non_expensable_item_register_transaction.size
    fill_in "Source", with: @project_wise_non_expensable_item_register_transaction.source
    fill_in "Specification", with: @project_wise_non_expensable_item_register_transaction.specification
    fill_in "Transaction type", with: @project_wise_non_expensable_item_register_transaction.transaction_type
    fill_in "User", with: @project_wise_non_expensable_item_register_transaction.user_id
    click_on "Create Project wise non expensable item register transaction"

    assert_text "Project wise non expensable item register transaction was successfully created"
    click_on "Back"
  end

  test "updating a Project wise non expensable item register transaction" do
    visit project_wise_non_expensable_item_register_transactions_url
    click_on "Edit", match: :first

    fill_in "Age", with: @project_wise_non_expensable_item_register_transaction.age
    fill_in "Amount", with: @project_wise_non_expensable_item_register_transaction.amount
    fill_in "Borrowed from", with: @project_wise_non_expensable_item_register_transaction.borrowed_from
    fill_in "Company or country", with: @project_wise_non_expensable_item_register_transaction.company_or_country
    fill_in "Date", with: @project_wise_non_expensable_item_register_transaction.date
    fill_in "Entry release no", with: @project_wise_non_expensable_item_register_transaction.entry_release_no
    fill_in "Fiscal year", with: @project_wise_non_expensable_item_register_transaction.fiscal_year_id
    fill_in "Fy", with: @project_wise_non_expensable_item_register_transaction.fy
    fill_in "Item", with: @project_wise_non_expensable_item_register_transaction.item_id
    fill_in "Item identification no", with: @project_wise_non_expensable_item_register_transaction.item_identification_no
    fill_in "Lended to", with: @project_wise_non_expensable_item_register_transaction.lended_to
    fill_in "Model no", with: @project_wise_non_expensable_item_register_transaction.model_no
    fill_in "Office", with: @project_wise_non_expensable_item_register_transaction.office_id
    fill_in "Project", with: @project_wise_non_expensable_item_register_transaction.project_id
    fill_in "Project item", with: @project_wise_non_expensable_item_register_transaction.project_item_id
    fill_in "Project main non expensable item register", with: @project_wise_non_expensable_item_register_transaction.project_main_non_expensable_item_register_id
    fill_in "Quantity", with: @project_wise_non_expensable_item_register_transaction.quantity
    fill_in "Rate", with: @project_wise_non_expensable_item_register_transaction.rate
    fill_in "Remarks", with: @project_wise_non_expensable_item_register_transaction.remarks
    fill_in "Size", with: @project_wise_non_expensable_item_register_transaction.size
    fill_in "Source", with: @project_wise_non_expensable_item_register_transaction.source
    fill_in "Specification", with: @project_wise_non_expensable_item_register_transaction.specification
    fill_in "Transaction type", with: @project_wise_non_expensable_item_register_transaction.transaction_type
    fill_in "User", with: @project_wise_non_expensable_item_register_transaction.user_id
    click_on "Update Project wise non expensable item register transaction"

    assert_text "Project wise non expensable item register transaction was successfully updated"
    click_on "Back"
  end

  test "destroying a Project wise non expensable item register transaction" do
    visit project_wise_non_expensable_item_register_transactions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Project wise non expensable item register transaction was successfully destroyed"
  end
end
