require 'test_helper'

class ProjectItemStocksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @project_item_stock = project_item_stocks(:one)
  end

  test "should get index" do
    get project_item_stocks_url
    assert_response :success
  end

  test "should get new" do
    get new_project_item_stock_url
    assert_response :success
  end

  test "should create project_item_stock" do
    assert_difference('ProjectItemStock.count') do
      post project_item_stocks_url, params: { project_item_stock: { amount: @project_item_stock.amount, fiscal_year_id: @project_item_stock.fiscal_year_id, item_id: @project_item_stock.item_id, office_id: @project_item_stock.office_id, project_item_id: @project_item_stock.project_item_id, quantity: @project_item_stock.quantity, rate: @project_item_stock.rate, user_id: @project_item_stock.user_id } }
    end

    assert_redirected_to project_item_stock_url(ProjectItemStock.last)
  end

  test "should show project_item_stock" do
    get project_item_stock_url(@project_item_stock)
    assert_response :success
  end

  test "should get edit" do
    get edit_project_item_stock_url(@project_item_stock)
    assert_response :success
  end

  test "should update project_item_stock" do
    patch project_item_stock_url(@project_item_stock), params: { project_item_stock: { amount: @project_item_stock.amount, fiscal_year_id: @project_item_stock.fiscal_year_id, item_id: @project_item_stock.item_id, office_id: @project_item_stock.office_id, project_item_id: @project_item_stock.project_item_id, quantity: @project_item_stock.quantity, rate: @project_item_stock.rate, user_id: @project_item_stock.user_id } }
    assert_redirected_to project_item_stock_url(@project_item_stock)
  end

  test "should destroy project_item_stock" do
    assert_difference('ProjectItemStock.count', -1) do
      delete project_item_stock_url(@project_item_stock)
    end

    assert_redirected_to project_item_stocks_url
  end
end
