require 'test_helper'

class ProjectStocksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @project_stock = project_stocks(:one)
  end

  test "should get index" do
    get project_stocks_url
    assert_response :success
  end

  test "should get new" do
    get new_project_stock_url
    assert_response :success
  end

  test "should create project_stock" do
    assert_difference('ProjectStock.count') do
      post project_stocks_url, params: { project_stock: { fiscal_year_id: @project_stock.fiscal_year_id, fy: @project_stock.fy, office_chief_designation: @project_stock.office_chief_designation, office_chief_name: @project_stock.office_chief_name, office_chief_signed_date: @project_stock.office_chief_signed_date, office_id: @project_stock.office_id, section_chief_designation: @project_stock.section_chief_designation, section_chief_name: @project_stock.section_chief_name, section_chief_signed_date: @project_stock.section_chief_signed_date, store_chief_designation: @project_stock.store_chief_designation, store_chief_name: @project_stock.store_chief_name, store_chief_sign_date: @project_stock.store_chief_sign_date, user_id: @project_stock.user_id } }
    end

    assert_redirected_to project_stock_url(ProjectStock.last)
  end

  test "should show project_stock" do
    get project_stock_url(@project_stock)
    assert_response :success
  end

  test "should get edit" do
    get edit_project_stock_url(@project_stock)
    assert_response :success
  end

  test "should update project_stock" do
    patch project_stock_url(@project_stock), params: { project_stock: { fiscal_year_id: @project_stock.fiscal_year_id, fy: @project_stock.fy, office_chief_designation: @project_stock.office_chief_designation, office_chief_name: @project_stock.office_chief_name, office_chief_signed_date: @project_stock.office_chief_signed_date, office_id: @project_stock.office_id, section_chief_designation: @project_stock.section_chief_designation, section_chief_name: @project_stock.section_chief_name, section_chief_signed_date: @project_stock.section_chief_signed_date, store_chief_designation: @project_stock.store_chief_designation, store_chief_name: @project_stock.store_chief_name, store_chief_sign_date: @project_stock.store_chief_sign_date, user_id: @project_stock.user_id } }
    assert_redirected_to project_stock_url(@project_stock)
  end

  test "should destroy project_stock" do
    assert_difference('ProjectStock.count', -1) do
      delete project_stock_url(@project_stock)
    end

    assert_redirected_to project_stocks_url
  end
end
