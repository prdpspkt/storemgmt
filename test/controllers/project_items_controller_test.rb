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
      post project_items_url, params: { project_item: { fiscal_year_id: @project_item.fiscal_year_id, item_classification_no: @project_item.item_classification_no, item_id: @project_item.item_id, item_identification_no: @project_item.item_identification_no, item_register_page_no: @project_item.item_register_page_no, model_no: @project_item.model_no, name_of_item_en: @project_item.name_of_item_en, name_of_item_ne: @project_item.name_of_item_ne, office_id: @project_item.office_id, project_id: @project_item.project_id, specification: @project_item.specification, unit_en: @project_item.unit_en, unit_ne: @project_item.unit_ne } }
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
    patch project_item_url(@project_item), params: { project_item: { fiscal_year_id: @project_item.fiscal_year_id, item_classification_no: @project_item.item_classification_no, item_id: @project_item.item_id, item_identification_no: @project_item.item_identification_no, item_register_page_no: @project_item.item_register_page_no, model_no: @project_item.model_no, name_of_item_en: @project_item.name_of_item_en, name_of_item_ne: @project_item.name_of_item_ne, office_id: @project_item.office_id, project_id: @project_item.project_id, specification: @project_item.specification, unit_en: @project_item.unit_en, unit_ne: @project_item.unit_ne } }
    assert_redirected_to project_item_url(@project_item)
  end

  test "should destroy project_item" do
    assert_difference('ProjectItem.count', -1) do
      delete project_item_url(@project_item)
    end

    assert_redirected_to project_items_url
  end
end
