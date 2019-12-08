require 'test_helper'

class ProjectEntryItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @project_entry_item = project_entry_items(:one)
  end

  test "should get index" do
    get project_entry_items_url
    assert_response :success
  end

  test "should get new" do
    get new_project_entry_item_url
    assert_response :success
  end

  test "should create project_entry_item" do
    assert_difference('ProjectEntryItem.count') do
      post project_entry_items_url, params: { project_entry_item: { fy_id: @project_entry_item.fy_id, item_id: @project_entry_item.item_id, item_register_page_no: @project_entry_item.item_register_page_no, name_of_item_en: @project_entry_item.name_of_item_en, name_of_item_ne: @project_entry_item.name_of_item_ne, office_id: @project_entry_item.office_id, type: @project_entry_item.type, unit_en: @project_entry_item.unit_en, unit_ne: @project_entry_item.unit_ne, user_id: @project_entry_item.user_id } }
    end

    assert_redirected_to project_entry_item_url(ProjectEntryItem.last)
  end

  test "should show project_entry_item" do
    get project_entry_item_url(@project_entry_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_project_entry_item_url(@project_entry_item)
    assert_response :success
  end

  test "should update project_entry_item" do
    patch project_entry_item_url(@project_entry_item), params: { project_entry_item: { fy_id: @project_entry_item.fy_id, item_id: @project_entry_item.item_id, item_register_page_no: @project_entry_item.item_register_page_no, name_of_item_en: @project_entry_item.name_of_item_en, name_of_item_ne: @project_entry_item.name_of_item_ne, office_id: @project_entry_item.office_id, type: @project_entry_item.type, unit_en: @project_entry_item.unit_en, unit_ne: @project_entry_item.unit_ne, user_id: @project_entry_item.user_id } }
    assert_redirected_to project_entry_item_url(@project_entry_item)
  end

  test "should destroy project_entry_item" do
    assert_difference('ProjectEntryItem.count', -1) do
      delete project_entry_item_url(@project_entry_item)
    end

    assert_redirected_to project_entry_items_url
  end
end
