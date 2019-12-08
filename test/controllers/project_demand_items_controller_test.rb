require 'test_helper'

class ProjectDemandItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @project_demand_item = project_demand_items(:one)
  end

  test "should get index" do
    get project_demand_items_url
    assert_response :success
  end

  test "should get new" do
    get new_project_demand_item_url
    assert_response :success
  end

  test "should create project_demand_item" do
    assert_difference('ProjectDemandItem.count') do
      post project_demand_items_url, params: { project_demand_item: { fiscal_year_id: @project_demand_item.fiscal_year_id, fy: @project_demand_item.fy, name_of_item: @project_demand_item.name_of_item, office_id: @project_demand_item.office_id, project_demand_id: @project_demand_item.project_demand_id, project_item_id: @project_demand_item.project_item_id, quantity: @project_demand_item.quantity, remark: @project_demand_item.remark, specification: @project_demand_item.specification, unit: @project_demand_item.unit, user_id: @project_demand_item.user_id } }
    end

    assert_redirected_to project_demand_item_url(ProjectDemandItem.last)
  end

  test "should show project_demand_item" do
    get project_demand_item_url(@project_demand_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_project_demand_item_url(@project_demand_item)
    assert_response :success
  end

  test "should update project_demand_item" do
    patch project_demand_item_url(@project_demand_item), params: { project_demand_item: { fiscal_year_id: @project_demand_item.fiscal_year_id, fy: @project_demand_item.fy, name_of_item: @project_demand_item.name_of_item, office_id: @project_demand_item.office_id, project_demand_id: @project_demand_item.project_demand_id, project_item_id: @project_demand_item.project_item_id, quantity: @project_demand_item.quantity, remark: @project_demand_item.remark, specification: @project_demand_item.specification, unit: @project_demand_item.unit, user_id: @project_demand_item.user_id } }
    assert_redirected_to project_demand_item_url(@project_demand_item)
  end

  test "should destroy project_demand_item" do
    assert_difference('ProjectDemandItem.count', -1) do
      delete project_demand_item_url(@project_demand_item)
    end

    assert_redirected_to project_demand_items_url
  end
end
