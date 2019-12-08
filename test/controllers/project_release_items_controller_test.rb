require 'test_helper'

class ProjectReleaseItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @project_release_item = project_release_items(:one)
  end

  test "should get index" do
    get project_release_items_url
    assert_response :success
  end

  test "should get new" do
    get new_project_release_item_url
    assert_response :success
  end

  test "should create project_release_item" do
    assert_difference('ProjectReleaseItem.count') do
      post project_release_items_url, params: { project_release_item: { amount: @project_release_item.amount, code_no: @project_release_item.code_no, fiscal_year_id: @project_release_item.fiscal_year_id, item_register_page_no: @project_release_item.item_register_page_no, name_of_item: @project_release_item.name_of_item, office_id: @project_release_item.office_id, office_release_id: @project_release_item.office_release_id, project_id: @project_release_item.project_id, project_item_id: @project_release_item.project_item_id, quantity: @project_release_item.quantity, rate: @project_release_item.rate, remarks: @project_release_item.remarks, specification: @project_release_item.specification, unit: @project_release_item.unit, user_id: @project_release_item.user_id } }
    end

    assert_redirected_to project_release_item_url(ProjectReleaseItem.last)
  end

  test "should show project_release_item" do
    get project_release_item_url(@project_release_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_project_release_item_url(@project_release_item)
    assert_response :success
  end

  test "should update project_release_item" do
    patch project_release_item_url(@project_release_item), params: { project_release_item: { amount: @project_release_item.amount, code_no: @project_release_item.code_no, fiscal_year_id: @project_release_item.fiscal_year_id, item_register_page_no: @project_release_item.item_register_page_no, name_of_item: @project_release_item.name_of_item, office_id: @project_release_item.office_id, office_release_id: @project_release_item.office_release_id, project_id: @project_release_item.project_id, project_item_id: @project_release_item.project_item_id, quantity: @project_release_item.quantity, rate: @project_release_item.rate, remarks: @project_release_item.remarks, specification: @project_release_item.specification, unit: @project_release_item.unit, user_id: @project_release_item.user_id } }
    assert_redirected_to project_release_item_url(@project_release_item)
  end

  test "should destroy project_release_item" do
    assert_difference('ProjectReleaseItem.count', -1) do
      delete project_release_item_url(@project_release_item)
    end

    assert_redirected_to project_release_items_url
  end
end
