require 'test_helper'

class DemandsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @demand = demands(:one)
  end

  test "should get index" do
    get demands_url
    assert_response :success
  end

  test "should get new" do
    get new_demand_url
    assert_response :success
  end

  test "should create demand" do
    assert_difference('Demand.count') do
      post demands_url, params: { demand: { demand_by: @demand.demand_by, demand_date: @demand.demand_date, demand_no: @demand.demand_no, fiscal_year: @demand.fiscal_year, fy: @demand.fy, needed_to_purchase: @demand.needed_to_purchase, office_id: @demand.office_id, ordered_by: @demand.ordered_by, ordered_date: @demand.ordered_date, recommended_by: @demand.recommended_by, recommended_date: @demand.recommended_date, recorded_by: @demand.recorded_by, recorded_date: @demand.recorded_date, user_id: @demand.user_id } }
    end

    assert_redirected_to demand_url(Demand.last)
  end

  test "should show demand" do
    get demand_url(@demand)
    assert_response :success
  end

  test "should get edit" do
    get edit_demand_url(@demand)
    assert_response :success
  end

  test "should update demand" do
    patch demand_url(@demand), params: { demand: { demand_by: @demand.demand_by, demand_date: @demand.demand_date, demand_no: @demand.demand_no, fiscal_year: @demand.fiscal_year, fy: @demand.fy, needed_to_purchase: @demand.needed_to_purchase, office_id: @demand.office_id, ordered_by: @demand.ordered_by, ordered_date: @demand.ordered_date, recommended_by: @demand.recommended_by, recommended_date: @demand.recommended_date, recorded_by: @demand.recorded_by, recorded_date: @demand.recorded_date, user_id: @demand.user_id } }
    assert_redirected_to demand_url(@demand)
  end

  test "should destroy demand" do
    assert_difference('Demand.count', -1) do
      delete demand_url(@demand)
    end

    assert_redirected_to demands_url
  end
end
