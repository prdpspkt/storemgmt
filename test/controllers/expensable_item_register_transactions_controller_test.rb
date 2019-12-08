require 'test_helper'

class ExpensableItemRegisterTransactionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @expensable_item_register_transaction = expensable_item_register_transactions(:one)
  end

  test "should get index" do
    get expensable_item_register_transactions_url
    assert_response :success
  end

  test "should get new" do
    get new_expensable_item_register_transaction_url
    assert_response :success
  end

  test "should create expensable_item_register_transaction" do
    assert_difference('ExpensableItemRegisterTransaction.count') do
      post expensable_item_register_transactions_url, params: { expensable_item_register_transaction: { amount: @expensable_item_register_transaction.amount, date: @expensable_item_register_transaction.date, entry_release_no: @expensable_item_register_transaction.entry_release_no, fiscal_year_id: @expensable_item_register_transaction.fiscal_year_id, fy: @expensable_item_register_transaction.fy, office_id: @expensable_item_register_transaction.office_id, quantity: @expensable_item_register_transaction.quantity, rate: @expensable_item_register_transaction.rate, remarks: @expensable_item_register_transaction.remarks, transaction_type: @expensable_item_register_transaction.transaction_type, user_id: @expensable_item_register_transaction.user_id } }
    end

    assert_redirected_to expensable_item_register_transaction_url(ExpensableItemRegisterTransaction.last)
  end

  test "should show expensable_item_register_transaction" do
    get expensable_item_register_transaction_url(@expensable_item_register_transaction)
    assert_response :success
  end

  test "should get edit" do
    get edit_expensable_item_register_transaction_url(@expensable_item_register_transaction)
    assert_response :success
  end

  test "should update expensable_item_register_transaction" do
    patch expensable_item_register_transaction_url(@expensable_item_register_transaction), params: { expensable_item_register_transaction: { amount: @expensable_item_register_transaction.amount, date: @expensable_item_register_transaction.date, entry_release_no: @expensable_item_register_transaction.entry_release_no, fiscal_year_id: @expensable_item_register_transaction.fiscal_year_id, fy: @expensable_item_register_transaction.fy, office_id: @expensable_item_register_transaction.office_id, quantity: @expensable_item_register_transaction.quantity, rate: @expensable_item_register_transaction.rate, remarks: @expensable_item_register_transaction.remarks, transaction_type: @expensable_item_register_transaction.transaction_type, user_id: @expensable_item_register_transaction.user_id } }
    assert_redirected_to expensable_item_register_transaction_url(@expensable_item_register_transaction)
  end

  test "should destroy expensable_item_register_transaction" do
    assert_difference('ExpensableItemRegisterTransaction.count', -1) do
      delete expensable_item_register_transaction_url(@expensable_item_register_transaction)
    end

    assert_redirected_to expensable_item_register_transactions_url
  end
end
