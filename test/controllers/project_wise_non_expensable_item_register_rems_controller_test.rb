require 'test_helper'

class ProjectWiseNonExpensableItemRegisterRemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @project_wise_non_expensable_item_register_rem = project_wise_non_expensable_item_register_rems(:one)
  end

  test "should get index" do
    get project_wise_non_expensable_item_register_rems_url
    assert_response :success
  end

  test "should get new" do
    get new_project_wise_non_expensable_item_register_rem_url
    assert_response :success
  end

  test "should create project_wise_non_expensable_item_register_rem" do
    assert_difference('ProjectWiseNonExpensableItemRegisterRem.count') do
      post project_wise_non_expensable_item_register_rems_url, params: { project_wise_non_expensable_item_register_rem: { amount: @project_wise_non_expensable_item_register_rem.amount, fiscal_year_id: @project_wise_non_expensable_item_register_rem.fiscal_year_id, fy: @project_wise_non_expensable_item_register_rem.fy, item_id: @project_wise_non_expensable_item_register_rem.item_id, office_id: @project_wise_non_expensable_item_register_rem.office_id, project_item_id: @project_wise_non_expensable_item_register_rem.project_item_id, quantity: @project_wise_non_expensable_item_register_rem.quantity, user_id: @project_wise_non_expensable_item_register_rem.user_id } }
    end

    assert_redirected_to project_wise_non_expensable_item_register_rem_url(ProjectWiseNonExpensableItemRegisterRem.last)
  end

  test "should show project_wise_non_expensable_item_register_rem" do
    get project_wise_non_expensable_item_register_rem_url(@project_wise_non_expensable_item_register_rem)
    assert_response :success
  end

  test "should get edit" do
    get edit_project_wise_non_expensable_item_register_rem_url(@project_wise_non_expensable_item_register_rem)
    assert_response :success
  end

  test "should update project_wise_non_expensable_item_register_rem" do
    patch project_wise_non_expensable_item_register_rem_url(@project_wise_non_expensable_item_register_rem), params: { project_wise_non_expensable_item_register_rem: { amount: @project_wise_non_expensable_item_register_rem.amount, fiscal_year_id: @project_wise_non_expensable_item_register_rem.fiscal_year_id, fy: @project_wise_non_expensable_item_register_rem.fy, item_id: @project_wise_non_expensable_item_register_rem.item_id, office_id: @project_wise_non_expensable_item_register_rem.office_id, project_item_id: @project_wise_non_expensable_item_register_rem.project_item_id, quantity: @project_wise_non_expensable_item_register_rem.quantity, user_id: @project_wise_non_expensable_item_register_rem.user_id } }
    assert_redirected_to project_wise_non_expensable_item_register_rem_url(@project_wise_non_expensable_item_register_rem)
  end

  test "should destroy project_wise_non_expensable_item_register_rem" do
    assert_difference('ProjectWiseNonExpensableItemRegisterRem.count', -1) do
      delete project_wise_non_expensable_item_register_rem_url(@project_wise_non_expensable_item_register_rem)
    end

    assert_redirected_to project_wise_non_expensable_item_register_rems_url
  end
end
