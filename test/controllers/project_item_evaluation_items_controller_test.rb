require 'test_helper'

class ProjectItemEvaluationItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @project_item_evaluation_item = project_item_evaluation_items(:one)
  end

  test "should get index" do
    get project_item_evaluation_items_url
    assert_response :success
  end

  test "should get new" do
    get new_project_item_evaluation_item_url
    assert_response :success
  end

  test "should create project_item_evaluation_item" do
    assert_difference('ProjectItemEvaluationItem.count') do
      post project_item_evaluation_items_url, params: { project_item_evaluation_item: { amount: @project_item_evaluation_item.amount, decreased_increased_quantity: @project_item_evaluation_item.decreased_increased_quantity, decreased_quantity: @project_item_evaluation_item.decreased_quantity, fiscal_year_id: @project_item_evaluation_item.fiscal_year_id, fy: @project_item_evaluation_item.fy, increased_quantity: @project_item_evaluation_item.increased_quantity, item_classification_no: @project_item_evaluation_item.item_classification_no, item_id: @project_item_evaluation_item.item_id, item_register_page_no: @project_item_evaluation_item.item_register_page_no, mached: @project_item_evaluation_item.mached, name_of_item: @project_item_evaluation_item.name_of_item, notworking: @project_item_evaluation_item.notworking, office_id: @project_item_evaluation_item.office_id, project_id: @project_item_evaluation_item.project_id, project_item_id: @project_item_evaluation_item.project_item_id, quantity: @project_item_evaluation_item.quantity, remarks: @project_item_evaluation_item.remarks, to_be_auctioned: @project_item_evaluation_item.to_be_auctioned, to_be_conserved: @project_item_evaluation_item.to_be_conserved, to_be_dispose: @project_item_evaluation_item.to_be_dispose, to_be_repaired: @project_item_evaluation_item.to_be_repaired, total_amount: @project_item_evaluation_item.total_amount, unit: @project_item_evaluation_item.unit, unmatched: @project_item_evaluation_item.unmatched, user_id: @project_item_evaluation_item.user_id, working: @project_item_evaluation_item.working } }
    end

    assert_redirected_to project_item_evaluation_item_url(ProjectItemEvaluationItem.last)
  end

  test "should show project_item_evaluation_item" do
    get project_item_evaluation_item_url(@project_item_evaluation_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_project_item_evaluation_item_url(@project_item_evaluation_item)
    assert_response :success
  end

  test "should update project_item_evaluation_item" do
    patch project_item_evaluation_item_url(@project_item_evaluation_item), params: { project_item_evaluation_item: { amount: @project_item_evaluation_item.amount, decreased_increased_quantity: @project_item_evaluation_item.decreased_increased_quantity, decreased_quantity: @project_item_evaluation_item.decreased_quantity, fiscal_year_id: @project_item_evaluation_item.fiscal_year_id, fy: @project_item_evaluation_item.fy, increased_quantity: @project_item_evaluation_item.increased_quantity, item_classification_no: @project_item_evaluation_item.item_classification_no, item_id: @project_item_evaluation_item.item_id, item_register_page_no: @project_item_evaluation_item.item_register_page_no, mached: @project_item_evaluation_item.mached, name_of_item: @project_item_evaluation_item.name_of_item, notworking: @project_item_evaluation_item.notworking, office_id: @project_item_evaluation_item.office_id, project_id: @project_item_evaluation_item.project_id, project_item_id: @project_item_evaluation_item.project_item_id, quantity: @project_item_evaluation_item.quantity, remarks: @project_item_evaluation_item.remarks, to_be_auctioned: @project_item_evaluation_item.to_be_auctioned, to_be_conserved: @project_item_evaluation_item.to_be_conserved, to_be_dispose: @project_item_evaluation_item.to_be_dispose, to_be_repaired: @project_item_evaluation_item.to_be_repaired, total_amount: @project_item_evaluation_item.total_amount, unit: @project_item_evaluation_item.unit, unmatched: @project_item_evaluation_item.unmatched, user_id: @project_item_evaluation_item.user_id, working: @project_item_evaluation_item.working } }
    assert_redirected_to project_item_evaluation_item_url(@project_item_evaluation_item)
  end

  test "should destroy project_item_evaluation_item" do
    assert_difference('ProjectItemEvaluationItem.count', -1) do
      delete project_item_evaluation_item_url(@project_item_evaluation_item)
    end

    assert_redirected_to project_item_evaluation_items_url
  end
end
