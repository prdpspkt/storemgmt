require 'test_helper'

class ProjectStockItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @project_stock_item = project_stock_items(:one)
  end

  test "should get index" do
    get project_stock_items_url
    assert_response :success
  end

  test "should get new" do
    get new_project_stock_item_url
    assert_response :success
  end

  test "should create project_stock_item" do
    assert_difference('ProjectStockItem.count') do
      post project_stock_items_url, params: { project_stock_item: { amount: @project_stock_item.amount, fiscal_year_id: @project_stock_item.fiscal_year_id, item_classification_no: @project_stock_item.item_classification_no, item_register_page_no: @project_stock_item.item_register_page_no, name_of_item: @project_stock_item.name_of_item, office_id: @project_stock_item.office_id, physical_status: @project_stock_item.physical_status, project_item_id: @project_stock_item.project_item_id, quantity: @project_stock_item.quantity, rate: @project_stock_item.rate, remarks: @project_stock_item.remarks, unit: @project_stock_item.unit, user_id: @project_stock_item.user_id } }
    end

    assert_redirected_to project_stock_item_url(ProjectStockItem.last)
  end

  test "should show project_stock_item" do
    get project_stock_item_url(@project_stock_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_project_stock_item_url(@project_stock_item)
    assert_response :success
  end

  test "should update project_stock_item" do
    patch project_stock_item_url(@project_stock_item), params: { project_stock_item: { amount: @project_stock_item.amount, fiscal_year_id: @project_stock_item.fiscal_year_id, item_classification_no: @project_stock_item.item_classification_no, item_register_page_no: @project_stock_item.item_register_page_no, name_of_item: @project_stock_item.name_of_item, office_id: @project_stock_item.office_id, physical_status: @project_stock_item.physical_status, project_item_id: @project_stock_item.project_item_id, quantity: @project_stock_item.quantity, rate: @project_stock_item.rate, remarks: @project_stock_item.remarks, unit: @project_stock_item.unit, user_id: @project_stock_item.user_id } }
    assert_redirected_to project_stock_item_url(@project_stock_item)
  end

  test "should destroy project_stock_item" do
    assert_difference('ProjectStockItem.count', -1) do
      delete project_stock_item_url(@project_stock_item)
    end

    assert_redirected_to project_stock_items_url
  end
end
