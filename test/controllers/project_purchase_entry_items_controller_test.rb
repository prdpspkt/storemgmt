require 'test_helper'

class ProjectPurchaseEntryItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @project_purchase_entry_item = project_purchase_entry_items(:one)
  end

  test "should get index" do
    get project_purchase_entry_items_url
    assert_response :success
  end

  test "should get new" do
    get new_project_purchase_entry_item_url
    assert_response :success
  end

  test "should create project_purchase_entry_item" do
    assert_difference('ProjectPurchaseEntryItem.count') do
      post project_purchase_entry_items_url, params: { project_purchase_entry_item: { amount: @project_purchase_entry_item.amount, amount_without_vat: @project_purchase_entry_item.amount_without_vat, approx_age: @project_purchase_entry_item.approx_age, country: @project_purchase_entry_item.country, fiscal_year_id: @project_purchase_entry_item.fiscal_year_id, is_vatable: @project_purchase_entry_item.is_vatable, item_classification_no: @project_purchase_entry_item.item_classification_no, item_id: @project_purchase_entry_item.item_id, item_register_page_no: @project_purchase_entry_item.item_register_page_no, model_no: @project_purchase_entry_item.model_no, office_id: @project_purchase_entry_item.office_id, other_expense: @project_purchase_entry_item.other_expense, project_item_id: @project_purchase_entry_item.project_item_id, project_purchase_entry_id: @project_purchase_entry_item.project_purchase_entry_id, quantity: @project_purchase_entry_item.quantity, rate: @project_purchase_entry_item.rate, remarks: @project_purchase_entry_item.remarks, size: @project_purchase_entry_item.size, source: @project_purchase_entry_item.source, total_amount: @project_purchase_entry_item.total_amount, user_id: @project_purchase_entry_item.user_id, vat: @project_purchase_entry_item.vat } }
    end

    assert_redirected_to project_purchase_entry_item_url(ProjectPurchaseEntryItem.last)
  end

  test "should show project_purchase_entry_item" do
    get project_purchase_entry_item_url(@project_purchase_entry_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_project_purchase_entry_item_url(@project_purchase_entry_item)
    assert_response :success
  end

  test "should update project_purchase_entry_item" do
    patch project_purchase_entry_item_url(@project_purchase_entry_item), params: { project_purchase_entry_item: { amount: @project_purchase_entry_item.amount, amount_without_vat: @project_purchase_entry_item.amount_without_vat, approx_age: @project_purchase_entry_item.approx_age, country: @project_purchase_entry_item.country, fiscal_year_id: @project_purchase_entry_item.fiscal_year_id, is_vatable: @project_purchase_entry_item.is_vatable, item_classification_no: @project_purchase_entry_item.item_classification_no, item_id: @project_purchase_entry_item.item_id, item_register_page_no: @project_purchase_entry_item.item_register_page_no, model_no: @project_purchase_entry_item.model_no, office_id: @project_purchase_entry_item.office_id, other_expense: @project_purchase_entry_item.other_expense, project_item_id: @project_purchase_entry_item.project_item_id, project_purchase_entry_id: @project_purchase_entry_item.project_purchase_entry_id, quantity: @project_purchase_entry_item.quantity, rate: @project_purchase_entry_item.rate, remarks: @project_purchase_entry_item.remarks, size: @project_purchase_entry_item.size, source: @project_purchase_entry_item.source, total_amount: @project_purchase_entry_item.total_amount, user_id: @project_purchase_entry_item.user_id, vat: @project_purchase_entry_item.vat } }
    assert_redirected_to project_purchase_entry_item_url(@project_purchase_entry_item)
  end

  test "should destroy project_purchase_entry_item" do
    assert_difference('ProjectPurchaseEntryItem.count', -1) do
      delete project_purchase_entry_item_url(@project_purchase_entry_item)
    end

    assert_redirected_to project_purchase_entry_items_url
  end
end
