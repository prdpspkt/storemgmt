require 'test_helper'

class NonExpensableItemRegisterTransactionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @non_expensable_item_register_transaction = non_expensable_item_register_transactions(:one)
  end

  test "should get index" do
    get non_expensable_item_register_transactions_url
    assert_response :success
  end

  test "should get new" do
    get new_non_expensable_item_register_transaction_url
    assert_response :success
  end

  test "should create non_expensable_item_register_transaction" do
    assert_difference('NonExpensableItemRegisterTransaction.count') do
      post non_expensable_item_register_transactions_url, params: { non_expensable_item_register_transaction: { age: @non_expensable_item_register_transaction.age, amount: @non_expensable_item_register_transaction.amount, company_or_country: @non_expensable_item_register_transaction.company_or_country, date: @non_expensable_item_register_transaction.date, entry_release_no: @non_expensable_item_register_transaction.entry_release_no, fiscal_year_id: @non_expensable_item_register_transaction.fiscal_year_id, fy: @non_expensable_item_register_transaction.fy, item_id: @non_expensable_item_register_transaction.item_id, item_identification_no: @non_expensable_item_register_transaction.item_identification_no, model_no: @non_expensable_item_register_transaction.model_no, non_expensable_item_register_id: @non_expensable_item_register_transaction.non_expensable_item_register_id, office_id: @non_expensable_item_register_transaction.office_id, quantity: @non_expensable_item_register_transaction.quantity, rate: @non_expensable_item_register_transaction.rate, size: @non_expensable_item_register_transaction.size, source: @non_expensable_item_register_transaction.source, specification: @non_expensable_item_register_transaction.specification, transaction_type: @non_expensable_item_register_transaction.transaction_type, user_id: @non_expensable_item_register_transaction.user_id } }
    end

    assert_redirected_to non_expensable_item_register_transaction_url(NonExpensableItemRegisterTransaction.last)
  end

  test "should show non_expensable_item_register_transaction" do
    get non_expensable_item_register_transaction_url(@non_expensable_item_register_transaction)
    assert_response :success
  end

  test "should get edit" do
    get edit_non_expensable_item_register_transaction_url(@non_expensable_item_register_transaction)
    assert_response :success
  end

  test "should update non_expensable_item_register_transaction" do
    patch non_expensable_item_register_transaction_url(@non_expensable_item_register_transaction), params: { non_expensable_item_register_transaction: { age: @non_expensable_item_register_transaction.age, amount: @non_expensable_item_register_transaction.amount, company_or_country: @non_expensable_item_register_transaction.company_or_country, date: @non_expensable_item_register_transaction.date, entry_release_no: @non_expensable_item_register_transaction.entry_release_no, fiscal_year_id: @non_expensable_item_register_transaction.fiscal_year_id, fy: @non_expensable_item_register_transaction.fy, item_id: @non_expensable_item_register_transaction.item_id, item_identification_no: @non_expensable_item_register_transaction.item_identification_no, model_no: @non_expensable_item_register_transaction.model_no, non_expensable_item_register_id: @non_expensable_item_register_transaction.non_expensable_item_register_id, office_id: @non_expensable_item_register_transaction.office_id, quantity: @non_expensable_item_register_transaction.quantity, rate: @non_expensable_item_register_transaction.rate, size: @non_expensable_item_register_transaction.size, source: @non_expensable_item_register_transaction.source, specification: @non_expensable_item_register_transaction.specification, transaction_type: @non_expensable_item_register_transaction.transaction_type, user_id: @non_expensable_item_register_transaction.user_id } }
    assert_redirected_to non_expensable_item_register_transaction_url(@non_expensable_item_register_transaction)
  end

  test "should destroy non_expensable_item_register_transaction" do
    assert_difference('NonExpensableItemRegisterTransaction.count', -1) do
      delete non_expensable_item_register_transaction_url(@non_expensable_item_register_transaction)
    end

    assert_redirected_to non_expensable_item_register_transactions_url
  end
end
