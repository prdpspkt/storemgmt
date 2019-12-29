require 'test_helper'

class SetupControllerTest < ActionDispatch::IntegrationTest
  test "should get new_office" do
    get setup_new_office_url
    assert_response :success
  end

  test "should get create_office" do
    get setup_create_office_url
    assert_response :success
  end

  test "should get new_fiscal_year" do
    get setup_new_fiscal_year_url
    assert_response :success
  end

  test "should get create_fiscal_year" do
    get setup_create_fiscal_year_url
    assert_response :success
  end

  test "should get new_office_chief" do
    get setup_new_office_chief_url
    assert_response :success
  end

  test "should get create_office_chief" do
    get setup_create_office_chief_url
    assert_response :success
  end

  test "should get new_section_chief" do
    get setup_new_section_chief_url
    assert_response :success
  end

  test "should get create_section_chief" do
    get setup_create_section_chief_url
    assert_response :success
  end

  test "should get new_store_keeper" do
    get setup_new_store_keeper_url
    assert_response :success
  end

  test "should get create_store_keeper" do
    get setup_create_store_keeper_url
    assert_response :success
  end

  test "should get new_conduction_body" do
    get setup_new_conduction_body_url
    assert_response :success
  end

  test "should get create_conduction_body" do
    get setup_create_conduction_body_url
    assert_response :success
  end

end
