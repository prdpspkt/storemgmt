require 'test_helper'

class ProjectEvaluationItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @project_evaluation_item = project_evaluation_items(:one)
  end

  test "should get index" do
    get project_evaluation_items_url
    assert_response :success
  end

  test "should get new" do
    get new_project_evaluation_item_url
    assert_response :success
  end

  test "should create project_evaluation_item" do
    assert_difference('ProjectEvaluationItem.count') do
      post project_evaluation_items_url, params: { project_evaluation_item: { amount: @project_evaluation_item.amount, decreased_quantity: @project_evaluation_item.decreased_quantity, dein_quantity: @project_evaluation_item.dein_quantity, fiscal_year_id: @project_evaluation_item.fiscal_year_id, fy: @project_evaluation_item.fy, increased_quantity: @project_evaluation_item.increased_quantity, item_classification_no: @project_evaluation_item.item_classification_no, item_id: @project_evaluation_item.item_id, item_register_page_no: @project_evaluation_item.item_register_page_no, mached: @project_evaluation_item.mached, marked_as_final: @project_evaluation_item.marked_as_final, name_of_item_en: @project_evaluation_item.name_of_item_en, name_of_item_ne: @project_evaluation_item.name_of_item_ne, not_working: @project_evaluation_item.not_working, office_id: @project_evaluation_item.office_id, project_item_id: @project_evaluation_item.project_item_id, quantity: @project_evaluation_item.quantity, remarks: @project_evaluation_item.remarks, to_be_auctioned: @project_evaluation_item.to_be_auctioned, to_be_conserved: @project_evaluation_item.to_be_conserved, to_be_dispose: @project_evaluation_item.to_be_dispose, to_be_repaired: @project_evaluation_item.to_be_repaired, total_amount: @project_evaluation_item.total_amount, unit_en: @project_evaluation_item.unit_en, unit_ne: @project_evaluation_item.unit_ne, unmatched: @project_evaluation_item.unmatched, user_id: @project_evaluation_item.user_id, working: @project_evaluation_item.working } }
    end

    assert_redirected_to project_evaluation_item_url(ProjectEvaluationItem.last)
  end

  test "should show project_evaluation_item" do
    get project_evaluation_item_url(@project_evaluation_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_project_evaluation_item_url(@project_evaluation_item)
    assert_response :success
  end

  test "should update project_evaluation_item" do
    patch project_evaluation_item_url(@project_evaluation_item), params: { project_evaluation_item: { amount: @project_evaluation_item.amount, decreased_quantity: @project_evaluation_item.decreased_quantity, dein_quantity: @project_evaluation_item.dein_quantity, fiscal_year_id: @project_evaluation_item.fiscal_year_id, fy: @project_evaluation_item.fy, increased_quantity: @project_evaluation_item.increased_quantity, item_classification_no: @project_evaluation_item.item_classification_no, item_id: @project_evaluation_item.item_id, item_register_page_no: @project_evaluation_item.item_register_page_no, mached: @project_evaluation_item.mached, marked_as_final: @project_evaluation_item.marked_as_final, name_of_item_en: @project_evaluation_item.name_of_item_en, name_of_item_ne: @project_evaluation_item.name_of_item_ne, not_working: @project_evaluation_item.not_working, office_id: @project_evaluation_item.office_id, project_item_id: @project_evaluation_item.project_item_id, quantity: @project_evaluation_item.quantity, remarks: @project_evaluation_item.remarks, to_be_auctioned: @project_evaluation_item.to_be_auctioned, to_be_conserved: @project_evaluation_item.to_be_conserved, to_be_dispose: @project_evaluation_item.to_be_dispose, to_be_repaired: @project_evaluation_item.to_be_repaired, total_amount: @project_evaluation_item.total_amount, unit_en: @project_evaluation_item.unit_en, unit_ne: @project_evaluation_item.unit_ne, unmatched: @project_evaluation_item.unmatched, user_id: @project_evaluation_item.user_id, working: @project_evaluation_item.working } }
    assert_redirected_to project_evaluation_item_url(@project_evaluation_item)
  end

  test "should destroy project_evaluation_item" do
    assert_difference('ProjectEvaluationItem.count', -1) do
      delete project_evaluation_item_url(@project_evaluation_item)
    end

    assert_redirected_to project_evaluation_items_url
  end
end
