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
      post project_purchase_entry_items_url, params: { project_purchase_entry_item: { amount: @project_purchase_entry_item.amount, amount_without_vat: @project_purchase_entry_item.amount_without_vat, fiscal_year: @project_purchase_entry_item.fiscal_year, fy: @project_purchase_entry_item.fy, item_classification_no: @project_purchase_entry_item.item_classification_no, item_identification_no: @project_purchase_entry_item.item_identification_no, item_registration_page_no: @project_purchase_entry_item.item_registration_page_no, model_no: @project_purchase_entry_item.model_no, name_of_item: @project_purchase_entry_item.name_of_item, office_id: @project_purchase_entry_item.office_id, other_expense: @project_purchase_entry_item.other_expense, project_purchase_entry_id: @project_purchase_entry_item.project_purchase_entry_id, purchase_handover_no: @project_purchase_entry_item.purchase_handover_no, quantity: @project_purchase_entry_item.quantity, rate: @project_purchase_entry_item.rate, remarks: @project_purchase_entry_item.remarks, specification: @project_purchase_entry_item.specification, total_amount: @project_purchase_entry_item.total_amount, unit: @project_purchase_entry_item.unit, user_id: @project_purchase_entry_item.user_id, vat: @project_purchase_entry_item.vat } }
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
    patch project_purchase_entry_item_url(@project_purchase_entry_item), params: { project_purchase_entry_item: { amount: @project_purchase_entry_item.amount, amount_without_vat: @project_purchase_entry_item.amount_without_vat, fiscal_year: @project_purchase_entry_item.fiscal_year, fy: @project_purchase_entry_item.fy, item_classification_no: @project_purchase_entry_item.item_classification_no, item_identification_no: @project_purchase_entry_item.item_identification_no, item_registration_page_no: @project_purchase_entry_item.item_registration_page_no, model_no: @project_purchase_entry_item.model_no, name_of_item: @project_purchase_entry_item.name_of_item, office_id: @project_purchase_entry_item.office_id, other_expense: @project_purchase_entry_item.other_expense, project_purchase_entry_id: @project_purchase_entry_item.project_purchase_entry_id, purchase_handover_no: @project_purchase_entry_item.purchase_handover_no, quantity: @project_purchase_entry_item.quantity, rate: @project_purchase_entry_item.rate, remarks: @project_purchase_entry_item.remarks, specification: @project_purchase_entry_item.specification, total_amount: @project_purchase_entry_item.total_amount, unit: @project_purchase_entry_item.unit, user_id: @project_purchase_entry_item.user_id, vat: @project_purchase_entry_item.vat } }
    assert_redirected_to project_purchase_entry_item_url(@project_purchase_entry_item)
  end

  test "should destroy project_purchase_entry_item" do
    assert_difference('ProjectPurchaseEntryItem.count', -1) do
      delete project_purchase_entry_item_url(@project_purchase_entry_item)
    end

    assert_redirected_to project_purchase_entry_items_url
  end
end
