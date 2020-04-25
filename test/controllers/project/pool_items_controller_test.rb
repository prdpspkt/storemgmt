require 'test_helper'

class Project::PoolItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @project_pool_item = project_pool_items(:one)
  end

  test "should get index" do
    get project_pool_items_url
    assert_response :success
  end

  test "should get new" do
    get new_project_pool_item_url
    assert_response :success
  end

  test "should create project_pool_item" do
    assert_difference('Project::PoolItem.count') do
      post project_pool_items_url, params: { project_pool_item: { item_category_id: @project_pool_item.item_category_id, name_of_item_en: @project_pool_item.name_of_item_en, name_of_item_ne: @project_pool_item.name_of_item_ne, unit_en: @project_pool_item.unit_en, unit_ne: @project_pool_item.unit_ne } }
    end

    assert_redirected_to project_pool_item_url(Project::PoolItem.last)
  end

  test "should show project_pool_item" do
    get project_pool_item_url(@project_pool_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_project_pool_item_url(@project_pool_item)
    assert_response :success
  end

  test "should update project_pool_item" do
    patch project_pool_item_url(@project_pool_item), params: { project_pool_item: { item_category_id: @project_pool_item.item_category_id, name_of_item_en: @project_pool_item.name_of_item_en, name_of_item_ne: @project_pool_item.name_of_item_ne, unit_en: @project_pool_item.unit_en, unit_ne: @project_pool_item.unit_ne } }
    assert_redirected_to project_pool_item_url(@project_pool_item)
  end

  test "should destroy project_pool_item" do
    assert_difference('Project::PoolItem.count', -1) do
      delete project_pool_item_url(@project_pool_item)
    end

    assert_redirected_to project_pool_items_url
  end
end
