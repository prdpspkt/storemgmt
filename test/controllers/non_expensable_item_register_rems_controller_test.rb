require 'test_helper'

class NonExpensableItemRegisterRemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @non_expensable_item_register_rem = non_expensable_item_register_rems(:one)
  end

  test "should get index" do
    get non_expensable_item_register_rems_url
    assert_response :success
  end

  test "should get new" do
    get new_non_expensable_item_register_rem_url
    assert_response :success
  end

  test "should create non_expensable_item_register_rem" do
    assert_difference('NonExpensableItemRegisterRem.count') do
      post non_expensable_item_register_rems_url, params: { non_expensable_item_register_rem: { amount: @non_expensable_item_register_rem.amount, fiscal_year_id: @non_expensable_item_register_rem.fiscal_year_id, fy: @non_expensable_item_register_rem.fy, item_id: @non_expensable_item_register_rem.item_id, office_id: @non_expensable_item_register_rem.office_id, office_item_id: @non_expensable_item_register_rem.office_item_id, quantity: @non_expensable_item_register_rem.quantity, user_id: @non_expensable_item_register_rem.user_id } }
    end

    assert_redirected_to non_expensable_item_register_rem_url(NonExpensableItemRegisterRem.last)
  end

  test "should show non_expensable_item_register_rem" do
    get non_expensable_item_register_rem_url(@non_expensable_item_register_rem)
    assert_response :success
  end

  test "should get edit" do
    get edit_non_expensable_item_register_rem_url(@non_expensable_item_register_rem)
    assert_response :success
  end

  test "should update non_expensable_item_register_rem" do
    patch non_expensable_item_register_rem_url(@non_expensable_item_register_rem), params: { non_expensable_item_register_rem: { amount: @non_expensable_item_register_rem.amount, fiscal_year_id: @non_expensable_item_register_rem.fiscal_year_id, fy: @non_expensable_item_register_rem.fy, item_id: @non_expensable_item_register_rem.item_id, office_id: @non_expensable_item_register_rem.office_id, office_item_id: @non_expensable_item_register_rem.office_item_id, quantity: @non_expensable_item_register_rem.quantity, user_id: @non_expensable_item_register_rem.user_id } }
    assert_redirected_to non_expensable_item_register_rem_url(@non_expensable_item_register_rem)
  end

  test "should destroy non_expensable_item_register_rem" do
    assert_difference('NonExpensableItemRegisterRem.count', -1) do
      delete non_expensable_item_register_rem_url(@non_expensable_item_register_rem)
    end

    assert_redirected_to non_expensable_item_register_rems_url
  end
end
