require 'test_helper'

class ProjectDemandsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @project_demand = project_demands(:one)
  end

  test "should get index" do
    get project_demands_url
    assert_response :success
  end

  test "should get new" do
    get new_project_demand_url
    assert_response :success
  end

  test "should create project_demand" do
    assert_difference('ProjectDemand.count') do
      post project_demands_url, params: { project_demand: { demand_by: @project_demand.demand_by, demand_date: @project_demand.demand_date, demand_no: @project_demand.demand_no, fiscal_year_id: @project_demand.fiscal_year_id, item_id: @project_demand.item_id, marked_as_final: @project_demand.marked_as_final, needed_to_purchase: @project_demand.needed_to_purchase, office_id: @project_demand.office_id, ordered_by: @project_demand.ordered_by, ordered_date: @project_demand.ordered_date, project_id: @project_demand.project_id, recommended_by: @project_demand.recommended_by, recorded_by: @project_demand.recorded_by, recorded_date: @project_demand.recorded_date, user_id: @project_demand.user_id } }
    end

    assert_redirected_to project_demand_url(ProjectDemand.last)
  end

  test "should show project_demand" do
    get project_demand_url(@project_demand)
    assert_response :success
  end

  test "should get edit" do
    get edit_project_demand_url(@project_demand)
    assert_response :success
  end

  test "should update project_demand" do
    patch project_demand_url(@project_demand), params: { project_demand: { demand_by: @project_demand.demand_by, demand_date: @project_demand.demand_date, demand_no: @project_demand.demand_no, fiscal_year_id: @project_demand.fiscal_year_id, item_id: @project_demand.item_id, marked_as_final: @project_demand.marked_as_final, needed_to_purchase: @project_demand.needed_to_purchase, office_id: @project_demand.office_id, ordered_by: @project_demand.ordered_by, ordered_date: @project_demand.ordered_date, project_id: @project_demand.project_id, recommended_by: @project_demand.recommended_by, recorded_by: @project_demand.recorded_by, recorded_date: @project_demand.recorded_date, user_id: @project_demand.user_id } }
    assert_redirected_to project_demand_url(@project_demand)
  end

  test "should destroy project_demand" do
    assert_difference('ProjectDemand.count', -1) do
      delete project_demand_url(@project_demand)
    end

    assert_redirected_to project_demands_url
  end
end
