require 'test_helper'

class ProjectTenderBreakdownItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @project_tender_breakdown_item = project_tender_breakdown_items(:one)
  end

  test "should get index" do
    get project_tender_breakdown_items_url
    assert_response :success
  end

  test "should get new" do
    get new_project_tender_breakdown_item_url
    assert_response :success
  end

  test "should create project_tender_breakdown_item" do
    assert_difference('ProjectTenderBreakdownItem.count') do
      post project_tender_breakdown_items_url, params: { project_tender_breakdown_item: { amount: @project_tender_breakdown_item.amount, fiscal_year_id: @project_tender_breakdown_item.fiscal_year_id, name_item_en: @project_tender_breakdown_item.name_item_en, name_of_item_ne: @project_tender_breakdown_item.name_of_item_ne, office_id: @project_tender_breakdown_item.office_id, project_tender_breakdown_id: @project_tender_breakdown_item.project_tender_breakdown_id, project_tender_item_id: @project_tender_breakdown_item.project_tender_item_id, quantity: @project_tender_breakdown_item.quantity, rate: @project_tender_breakdown_item.rate, received_date: @project_tender_breakdown_item.received_date, unit_en: @project_tender_breakdown_item.unit_en, unit_ne: @project_tender_breakdown_item.unit_ne, user_id: @project_tender_breakdown_item.user_id } }
    end

    assert_redirected_to project_tender_breakdown_item_url(ProjectTenderBreakdownItem.last)
  end

  test "should show project_tender_breakdown_item" do
    get project_tender_breakdown_item_url(@project_tender_breakdown_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_project_tender_breakdown_item_url(@project_tender_breakdown_item)
    assert_response :success
  end

  test "should update project_tender_breakdown_item" do
    patch project_tender_breakdown_item_url(@project_tender_breakdown_item), params: { project_tender_breakdown_item: { amount: @project_tender_breakdown_item.amount, fiscal_year_id: @project_tender_breakdown_item.fiscal_year_id, name_item_en: @project_tender_breakdown_item.name_item_en, name_of_item_ne: @project_tender_breakdown_item.name_of_item_ne, office_id: @project_tender_breakdown_item.office_id, project_tender_breakdown_id: @project_tender_breakdown_item.project_tender_breakdown_id, project_tender_item_id: @project_tender_breakdown_item.project_tender_item_id, quantity: @project_tender_breakdown_item.quantity, rate: @project_tender_breakdown_item.rate, received_date: @project_tender_breakdown_item.received_date, unit_en: @project_tender_breakdown_item.unit_en, unit_ne: @project_tender_breakdown_item.unit_ne, user_id: @project_tender_breakdown_item.user_id } }
    assert_redirected_to project_tender_breakdown_item_url(@project_tender_breakdown_item)
  end

  test "should destroy project_tender_breakdown_item" do
    assert_difference('ProjectTenderBreakdownItem.count', -1) do
      delete project_tender_breakdown_item_url(@project_tender_breakdown_item)
    end

    assert_redirected_to project_tender_breakdown_items_url
  end
end
