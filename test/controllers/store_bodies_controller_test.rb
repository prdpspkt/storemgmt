require 'test_helper'

class StoreBodiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @store_body = store_bodies(:one)
  end

  test "should get index" do
    get store_bodies_url
    assert_response :success
  end

  test "should get new" do
    get new_store_body_url
    assert_response :success
  end

  test "should create store_body" do
    assert_difference('StoreBody.count') do
      post store_bodies_url, params: { store_body: { fiscal_year_id: @store_body.fiscal_year_id, office_chief: @store_body.office_chief, office_chief_degination: @store_body.office_chief_degination, office_id: @store_body.office_id, section_chief: @store_body.section_chief, section_chief_degination: @store_body.section_chief_degination, status: @store_body.status, store_keeper_designation: @store_body.store_keeper_designation, store_keeper_name: @store_body.store_keeper_name } }
    end

    assert_redirected_to store_body_url(StoreBody.last)
  end

  test "should show store_body" do
    get store_body_url(@store_body)
    assert_response :success
  end

  test "should get edit" do
    get edit_store_body_url(@store_body)
    assert_response :success
  end

  test "should update store_body" do
    patch store_body_url(@store_body), params: { store_body: { fiscal_year_id: @store_body.fiscal_year_id, office_chief: @store_body.office_chief, office_chief_degination: @store_body.office_chief_degination, office_id: @store_body.office_id, section_chief: @store_body.section_chief, section_chief_degination: @store_body.section_chief_degination, status: @store_body.status, store_keeper_designation: @store_body.store_keeper_designation, store_keeper_name: @store_body.store_keeper_name } }
    assert_redirected_to store_body_url(@store_body)
  end

  test "should destroy store_body" do
    assert_difference('StoreBody.count', -1) do
      delete store_body_url(@store_body)
    end

    assert_redirected_to store_bodies_url
  end
end
