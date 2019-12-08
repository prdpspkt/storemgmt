require 'test_helper'

class ExpensableItemRegisterRemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @expensable_item_register_rem = expensable_item_register_rems(:one)
  end

  test "should get index" do
    get expensable_item_register_rems_url
    assert_response :success
  end

  test "should get new" do
    get new_expensable_item_register_rem_url
    assert_response :success
  end

  test "should create expensable_item_register_rem" do
    assert_difference('ExpensableItemRegisterRem.count') do
      post expensable_item_register_rems_url, params: { expensable_item_register_rem: { amount: @expensable_item_register_rem.amount, office_item_id: @expensable_item_register_rem.office_item_id, quantity: @expensable_item_register_rem.quantity } }
    end

    assert_redirected_to expensable_item_register_rem_url(ExpensableItemRegisterRem.last)
  end

  test "should show expensable_item_register_rem" do
    get expensable_item_register_rem_url(@expensable_item_register_rem)
    assert_response :success
  end

  test "should get edit" do
    get edit_expensable_item_register_rem_url(@expensable_item_register_rem)
    assert_response :success
  end

  test "should update expensable_item_register_rem" do
    patch expensable_item_register_rem_url(@expensable_item_register_rem), params: { expensable_item_register_rem: { amount: @expensable_item_register_rem.amount, office_item_id: @expensable_item_register_rem.office_item_id, quantity: @expensable_item_register_rem.quantity } }
    assert_redirected_to expensable_item_register_rem_url(@expensable_item_register_rem)
  end

  test "should destroy expensable_item_register_rem" do
    assert_difference('ExpensableItemRegisterRem.count', -1) do
      delete expensable_item_register_rem_url(@expensable_item_register_rem)
    end

    assert_redirected_to expensable_item_register_rems_url
  end
end
