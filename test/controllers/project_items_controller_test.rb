require 'test_helper'

class ProjectItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @project_item = project_items(:one)
  end

  test "should get index" do
    get project_items_url
    assert_response :success
  end

  test "should get new" do
    get new_project_item_url
    assert_response :success
  end

  test "should create project_item" do
    assert_difference('ProjectItem.count') do
      post project_items_url, params: { project_item: { fy_id: @project_item.fy_id, item_id: @project_item.item_id, item_register_page_no: @project_item.item_register_page_no, name_of_item_en: @project_item.name_of_item_en, name_of_item_ne: @project_item.name_of_item_ne, not_working: @project_item.not_working, office_id: @project_item.office_id, project_id: @project_item.project_id, to_be_auctioned: @project_item.to_be_auctioned, to_be_conserved: @project_item.to_be_conserved, to_be_repaired: @project_item.to_be_repaired, type: @project_item.type, unit_en: @project_item.unit_en, unit_ne: @project_item.unit_ne, user_id: @project_item.user_id, working: @project_item.working } }
    end

    assert_redirected_to project_item_url(ProjectItem.last)
  end

  test "should show project_item" do
    get project_item_url(@project_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_project_item_url(@project_item)
    assert_response :success
  end

  test "should update project_item" do
    patch project_item_url(@project_item), params: { project_item: { fy_id: @project_item.fy_id, item_id: @project_item.item_id, item_register_page_no: @project_item.item_register_page_no, name_of_item_en: @project_item.name_of_item_en, name_of_item_ne: @project_item.name_of_item_ne, not_working: @project_item.not_working, office_id: @project_item.office_id, project_id: @project_item.project_id, to_be_auctioned: @project_item.to_be_auctioned, to_be_conserved: @project_item.to_be_conserved, to_be_repaired: @project_item.to_be_repaired, type: @project_item.type, unit_en: @project_item.unit_en, unit_ne: @project_item.unit_ne, user_id: @project_item.user_id, working: @project_item.working } }
    assert_redirected_to project_item_url(@project_item)
  end

  test "should destroy project_item" do
    assert_difference('ProjectItem.count', -1) do
      delete project_item_url(@project_item)
    end

    assert_redirected_to project_items_url
  end
end
