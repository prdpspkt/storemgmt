require 'test_helper'

class ProjectHandoverFormItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @project_handover_form_item = project_handover_form_items(:one)
  end

  test "should get index" do
    get project_handover_form_items_url
    assert_response :success
  end

  test "should get new" do
    get new_project_handover_form_item_url
    assert_response :success
  end

  test "should create project_handover_form_item" do
    assert_difference('ProjectHandoverFormItem.count') do
      post project_handover_form_items_url, params: { project_handover_form_item: { amount: @project_handover_form_item.amount, approx_age: @project_handover_form_item.approx_age, country: @project_handover_form_item.country, fiscal_year_id: @project_handover_form_item.fiscal_year_id, fy: @project_handover_form_item.fy, handover_form_id: @project_handover_form_item.handover_form_id, item_classification_no: @project_handover_form_item.item_classification_no, item_id: @project_handover_form_item.item_id, item_identification_no: @project_handover_form_item.item_identification_no, item_register_page_no: @project_handover_form_item.item_register_page_no, model_no: @project_handover_form_item.model_no, name_of_item_en: @project_handover_form_item.name_of_item_en, name_of_item_ne: @project_handover_form_item.name_of_item_ne, office_id: @project_handover_form_item.office_id, physical_status: @project_handover_form_item.physical_status, project_handover_form_id: @project_handover_form_item.project_handover_form_id, project_id: @project_handover_form_item.project_id, project_item_id: @project_handover_form_item.project_item_id, quantity: @project_handover_form_item.quantity, received_date: @project_handover_form_item.received_date, size: @project_handover_form_item.size, source: @project_handover_form_item.source, specification: @project_handover_form_item.specification, unit_en: @project_handover_form_item.unit_en, unit_ne: @project_handover_form_item.unit_ne, user_id: @project_handover_form_item.user_id } }
    end

    assert_redirected_to project_handover_form_item_url(ProjectHandoverFormItem.last)
  end

  test "should show project_handover_form_item" do
    get project_handover_form_item_url(@project_handover_form_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_project_handover_form_item_url(@project_handover_form_item)
    assert_response :success
  end

  test "should update project_handover_form_item" do
    patch project_handover_form_item_url(@project_handover_form_item), params: { project_handover_form_item: { amount: @project_handover_form_item.amount, approx_age: @project_handover_form_item.approx_age, country: @project_handover_form_item.country, fiscal_year_id: @project_handover_form_item.fiscal_year_id, fy: @project_handover_form_item.fy, handover_form_id: @project_handover_form_item.handover_form_id, item_classification_no: @project_handover_form_item.item_classification_no, item_id: @project_handover_form_item.item_id, item_identification_no: @project_handover_form_item.item_identification_no, item_register_page_no: @project_handover_form_item.item_register_page_no, model_no: @project_handover_form_item.model_no, name_of_item_en: @project_handover_form_item.name_of_item_en, name_of_item_ne: @project_handover_form_item.name_of_item_ne, office_id: @project_handover_form_item.office_id, physical_status: @project_handover_form_item.physical_status, project_handover_form_id: @project_handover_form_item.project_handover_form_id, project_id: @project_handover_form_item.project_id, project_item_id: @project_handover_form_item.project_item_id, quantity: @project_handover_form_item.quantity, received_date: @project_handover_form_item.received_date, size: @project_handover_form_item.size, source: @project_handover_form_item.source, specification: @project_handover_form_item.specification, unit_en: @project_handover_form_item.unit_en, unit_ne: @project_handover_form_item.unit_ne, user_id: @project_handover_form_item.user_id } }
    assert_redirected_to project_handover_form_item_url(@project_handover_form_item)
  end

  test "should destroy project_handover_form_item" do
    assert_difference('ProjectHandoverFormItem.count', -1) do
      delete project_handover_form_item_url(@project_handover_form_item)
    end

    assert_redirected_to project_handover_form_items_url
  end
end
