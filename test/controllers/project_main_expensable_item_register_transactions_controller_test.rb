require 'test_helper'

class ProjectMainExpensableItemRegisterTransactionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @project_main_expensable_item_register_transaction = project_main_expensable_item_register_transactions(:one)
  end

  test "should get index" do
    get project_main_expensable_item_register_transactions_url
    assert_response :success
  end

  test "should get new" do
    get new_project_main_expensable_item_register_transaction_url
    assert_response :success
  end

  test "should create project_main_expensable_item_register_transaction" do
    assert_difference('ProjectMainExpensableItemRegisterTransaction.count') do
      post project_main_expensable_item_register_transactions_url, params: { project_main_expensable_item_register_transaction: { amount: @project_main_expensable_item_register_transaction.amount, date: @project_main_expensable_item_register_transaction.date, entry_release_no: @project_main_expensable_item_register_transaction.entry_release_no, fiscal_year_id: @project_main_expensable_item_register_transaction.fiscal_year_id, fy: @project_main_expensable_item_register_transaction.fy, office_id: @project_main_expensable_item_register_transaction.office_id, project_id: @project_main_expensable_item_register_transaction.project_id, quantity: @project_main_expensable_item_register_transaction.quantity, rate: @project_main_expensable_item_register_transaction.rate, remarks: @project_main_expensable_item_register_transaction.remarks, transaction_type: @project_main_expensable_item_register_transaction.transaction_type, user_id: @project_main_expensable_item_register_transaction.user_id } }
    end

    assert_redirected_to project_main_expensable_item_register_transaction_url(ProjectMainExpensableItemRegisterTransaction.last)
  end

  test "should show project_main_expensable_item_register_transaction" do
    get project_main_expensable_item_register_transaction_url(@project_main_expensable_item_register_transaction)
    assert_response :success
  end

  test "should get edit" do
    get edit_project_main_expensable_item_register_transaction_url(@project_main_expensable_item_register_transaction)
    assert_response :success
  end

  test "should update project_main_expensable_item_register_transaction" do
    patch project_main_expensable_item_register_transaction_url(@project_main_expensable_item_register_transaction), params: { project_main_expensable_item_register_transaction: { amount: @project_main_expensable_item_register_transaction.amount, date: @project_main_expensable_item_register_transaction.date, entry_release_no: @project_main_expensable_item_register_transaction.entry_release_no, fiscal_year_id: @project_main_expensable_item_register_transaction.fiscal_year_id, fy: @project_main_expensable_item_register_transaction.fy, office_id: @project_main_expensable_item_register_transaction.office_id, project_id: @project_main_expensable_item_register_transaction.project_id, quantity: @project_main_expensable_item_register_transaction.quantity, rate: @project_main_expensable_item_register_transaction.rate, remarks: @project_main_expensable_item_register_transaction.remarks, transaction_type: @project_main_expensable_item_register_transaction.transaction_type, user_id: @project_main_expensable_item_register_transaction.user_id } }
    assert_redirected_to project_main_expensable_item_register_transaction_url(@project_main_expensable_item_register_transaction)
  end

  test "should destroy project_main_expensable_item_register_transaction" do
    assert_difference('ProjectMainExpensableItemRegisterTransaction.count', -1) do
      delete project_main_expensable_item_register_transaction_url(@project_main_expensable_item_register_transaction)
    end

    assert_redirected_to project_main_expensable_item_register_transactions_url
  end
end
