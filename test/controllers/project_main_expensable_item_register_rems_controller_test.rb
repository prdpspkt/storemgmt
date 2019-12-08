require 'test_helper'

class ProjectMainExpensableItemRegisterRemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @project_main_expensable_item_register_rem = project_main_expensable_item_register_rems(:one)
  end

  test "should get index" do
    get project_main_expensable_item_register_rems_url
    assert_response :success
  end

  test "should get new" do
    get new_project_main_expensable_item_register_rem_url
    assert_response :success
  end

  test "should create project_main_expensable_item_register_rem" do
    assert_difference('ProjectMainExpensableItemRegisterRem.count') do
      post project_main_expensable_item_register_rems_url, params: { project_main_expensable_item_register_rem: { amount: @project_main_expensable_item_register_rem.amount, office_item_id: @project_main_expensable_item_register_rem.office_item_id, project_main_expensable_item_register_transaction_id: @project_main_expensable_item_register_rem.project_main_expensable_item_register_transaction_id, quantity: @project_main_expensable_item_register_rem.quantity } }
    end

    assert_redirected_to project_main_expensable_item_register_rem_url(ProjectMainExpensableItemRegisterRem.last)
  end

  test "should show project_main_expensable_item_register_rem" do
    get project_main_expensable_item_register_rem_url(@project_main_expensable_item_register_rem)
    assert_response :success
  end

  test "should get edit" do
    get edit_project_main_expensable_item_register_rem_url(@project_main_expensable_item_register_rem)
    assert_response :success
  end

  test "should update project_main_expensable_item_register_rem" do
    patch project_main_expensable_item_register_rem_url(@project_main_expensable_item_register_rem), params: { project_main_expensable_item_register_rem: { amount: @project_main_expensable_item_register_rem.amount, office_item_id: @project_main_expensable_item_register_rem.office_item_id, project_main_expensable_item_register_transaction_id: @project_main_expensable_item_register_rem.project_main_expensable_item_register_transaction_id, quantity: @project_main_expensable_item_register_rem.quantity } }
    assert_redirected_to project_main_expensable_item_register_rem_url(@project_main_expensable_item_register_rem)
  end

  test "should destroy project_main_expensable_item_register_rem" do
    assert_difference('ProjectMainExpensableItemRegisterRem.count', -1) do
      delete project_main_expensable_item_register_rem_url(@project_main_expensable_item_register_rem)
    end

    assert_redirected_to project_main_expensable_item_register_rems_url
  end
end
