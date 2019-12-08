require 'test_helper'

class FiscalYearsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @fiscal_year = fiscal_years(:one)
  end

  test "should get index" do
    get fiscal_years_url
    assert_response :success
  end

  test "should get new" do
    get new_fiscal_year_url
    assert_response :success
  end

  test "should create fiscal_year" do
    assert_difference('FiscalYear.count') do
      post fiscal_years_url, params: { fiscal_year: { fy: @fiscal_year.fy, office_id: @fiscal_year.office_id, user_id: @fiscal_year.user_id } }
    end

    assert_redirected_to fiscal_year_url(FiscalYear.last)
  end

  test "should show fiscal_year" do
    get fiscal_year_url(@fiscal_year)
    assert_response :success
  end

  test "should get edit" do
    get edit_fiscal_year_url(@fiscal_year)
    assert_response :success
  end

  test "should update fiscal_year" do
    patch fiscal_year_url(@fiscal_year), params: { fiscal_year: { fy: @fiscal_year.fy, office_id: @fiscal_year.office_id, user_id: @fiscal_year.user_id } }
    assert_redirected_to fiscal_year_url(@fiscal_year)
  end

  test "should destroy fiscal_year" do
    assert_difference('FiscalYear.count', -1) do
      delete fiscal_year_url(@fiscal_year)
    end

    assert_redirected_to fiscal_years_url
  end
end
