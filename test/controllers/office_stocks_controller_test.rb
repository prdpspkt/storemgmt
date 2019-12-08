require 'test_helper'

class OfficeStocksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @office_stock = office_stocks(:one)
  end

  test "should get index" do
    get office_stocks_url
    assert_response :success
  end

  test "should get new" do
    get new_office_stock_url
    assert_response :success
  end

  test "should create office_stock" do
    assert_difference('OfficeStock.count') do
      post office_stocks_url, params: { office_stock: { fiscal_year_id: @office_stock.fiscal_year_id, fy: @office_stock.fy, office_chief_designation: @office_stock.office_chief_designation, office_chief_name: @office_stock.office_chief_name, office_chief_signed_date: @office_stock.office_chief_signed_date, office_id: @office_stock.office_id, section_chief_designation: @office_stock.section_chief_designation, section_chief_name: @office_stock.section_chief_name, section_chief_signed_date: @office_stock.section_chief_signed_date, store_chief_designation: @office_stock.store_chief_designation, store_chief_name: @office_stock.store_chief_name, store_chief_sign_date: @office_stock.store_chief_sign_date, user_id: @office_stock.user_id } }
    end

    assert_redirected_to office_stock_url(OfficeStock.last)
  end

  test "should show office_stock" do
    get office_stock_url(@office_stock)
    assert_response :success
  end

  test "should get edit" do
    get edit_office_stock_url(@office_stock)
    assert_response :success
  end

  test "should update office_stock" do
    patch office_stock_url(@office_stock), params: { office_stock: { fiscal_year_id: @office_stock.fiscal_year_id, fy: @office_stock.fy, office_chief_designation: @office_stock.office_chief_designation, office_chief_name: @office_stock.office_chief_name, office_chief_signed_date: @office_stock.office_chief_signed_date, office_id: @office_stock.office_id, section_chief_designation: @office_stock.section_chief_designation, section_chief_name: @office_stock.section_chief_name, section_chief_signed_date: @office_stock.section_chief_signed_date, store_chief_designation: @office_stock.store_chief_designation, store_chief_name: @office_stock.store_chief_name, store_chief_sign_date: @office_stock.store_chief_sign_date, user_id: @office_stock.user_id } }
    assert_redirected_to office_stock_url(@office_stock)
  end

  test "should destroy office_stock" do
    assert_difference('OfficeStock.count', -1) do
      delete office_stock_url(@office_stock)
    end

    assert_redirected_to office_stocks_url
  end
end
