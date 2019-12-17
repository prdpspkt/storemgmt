require 'test_helper'

class ProjectTenderItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @project_tender_item = project_tender_items(:one)
  end

  test "should get index" do
    get project_tender_items_url
    assert_response :success
  end

  test "should get new" do
    get new_project_tender_item_url
    assert_response :success
  end

  test "should create project_tender_item" do
    assert_difference('ProjectTenderItem.count') do
      post project_tender_items_url, params: { project_tender_item: { amount: @project_tender_item.amount, fiscal_year_id: @project_tender_item.fiscal_year_id, fy: @project_tender_item.fy, name_of_item_en: @project_tender_item.name_of_item_en, name_of_item_ne: @project_tender_item.name_of_item_ne, office_id: @project_tender_item.office_id, project_purchase_tender_id: @project_tender_item.project_purchase_tender_id, quantity: @project_tender_item.quantity, rate: @project_tender_item.rate, received_date: @project_tender_item.received_date, unit_en: @project_tender_item.unit_en, unit_ne: @project_tender_item.unit_ne, user_id: @project_tender_item.user_id } }
    end

    assert_redirected_to project_tender_item_url(ProjectTenderItem.last)
  end

  test "should show project_tender_item" do
    get project_tender_item_url(@project_tender_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_project_tender_item_url(@project_tender_item)
    assert_response :success
  end

  test "should update project_tender_item" do
    patch project_tender_item_url(@project_tender_item), params: { project_tender_item: { amount: @project_tender_item.amount, fiscal_year_id: @project_tender_item.fiscal_year_id, fy: @project_tender_item.fy, name_of_item_en: @project_tender_item.name_of_item_en, name_of_item_ne: @project_tender_item.name_of_item_ne, office_id: @project_tender_item.office_id, project_purchase_tender_id: @project_tender_item.project_purchase_tender_id, quantity: @project_tender_item.quantity, rate: @project_tender_item.rate, received_date: @project_tender_item.received_date, unit_en: @project_tender_item.unit_en, unit_ne: @project_tender_item.unit_ne, user_id: @project_tender_item.user_id } }
    assert_redirected_to project_tender_item_url(@project_tender_item)
  end

  test "should destroy project_tender_item" do
    assert_difference('ProjectTenderItem.count', -1) do
      delete project_tender_item_url(@project_tender_item)
    end

    assert_redirected_to project_tender_items_url
  end
end
