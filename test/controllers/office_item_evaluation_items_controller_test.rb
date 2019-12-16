require 'test_helper'

class OfficeItemEvaluationItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @office_item_evaluation_item = office_item_evaluation_items(:one)
  end

  test "should get index" do
    get project_item_evaluation_items_url
    assert_response :success
  end

  test "should get new" do
    get new_project_item_evaluation_item_url
    assert_response :success
  end

  test "should create office_item_evaluation_item" do
    assert_difference('OfficeItemEvaluationItem.count') do
      post project_item_evaluation_items_url, params: {office_item_evaluation_item: {amount: @office_item_evaluation_item.amount, decreased_increased_quantity: @office_item_evaluation_item.decreased_increased_quantity, decreased_quantity: @office_item_evaluation_item.decreased_quantity, fiscal_year_id: @office_item_evaluation_item.fiscal_year_id, fy: @office_item_evaluation_item.fy, increased_quantity: @office_item_evaluation_item.increased_quantity, item_classification_no: @office_item_evaluation_item.item_classification_no, item_id: @office_item_evaluation_item.item_id, item_register_page_no: @office_item_evaluation_item.item_register_page_no, mached: @office_item_evaluation_item.mached, name_of_item: @office_item_evaluation_item.name_of_item, notworking: @office_item_evaluation_item.notworking, office_id: @office_item_evaluation_item.office_id, office_item_id: @office_item_evaluation_item.office_item_id, quantity: @office_item_evaluation_item.quantity, remarks: @office_item_evaluation_item.remarks, to_be_auctioned: @office_item_evaluation_item.to_be_auctioned, to_be_conserved: @office_item_evaluation_item.to_be_conserved, to_be_dispose: @office_item_evaluation_item.to_be_dispose, to_be_repaired: @office_item_evaluation_item.to_be_repaired, total_amount: @office_item_evaluation_item.total_amount, unit: @office_item_evaluation_item.unit, unmatched: @office_item_evaluation_item.unmatched, user_id: @office_item_evaluation_item.user_id, working: @office_item_evaluation_item.working } }
    end

    assert_redirected_to project_item_evaluation_item_url(OfficeItemEvaluationItem.last)
  end

  test "should show office_item_evaluation_item" do
    get project_item_evaluation_item_url(@office_item_evaluation_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_project_item_evaluation_item_url(@office_item_evaluation_item)
    assert_response :success
  end

  test "should update office_item_evaluation_item" do
    patch project_item_evaluation_item_url(@office_item_evaluation_item), params: {office_item_evaluation_item: {amount: @office_item_evaluation_item.amount, decreased_increased_quantity: @office_item_evaluation_item.decreased_increased_quantity, decreased_quantity: @office_item_evaluation_item.decreased_quantity, fiscal_year_id: @office_item_evaluation_item.fiscal_year_id, fy: @office_item_evaluation_item.fy, increased_quantity: @office_item_evaluation_item.increased_quantity, item_classification_no: @office_item_evaluation_item.item_classification_no, item_id: @office_item_evaluation_item.item_id, item_register_page_no: @office_item_evaluation_item.item_register_page_no, mached: @office_item_evaluation_item.mached, name_of_item: @office_item_evaluation_item.name_of_item, notworking: @office_item_evaluation_item.notworking, office_id: @office_item_evaluation_item.office_id, office_item_id: @office_item_evaluation_item.office_item_id, quantity: @office_item_evaluation_item.quantity, remarks: @office_item_evaluation_item.remarks, to_be_auctioned: @office_item_evaluation_item.to_be_auctioned, to_be_conserved: @office_item_evaluation_item.to_be_conserved, to_be_dispose: @office_item_evaluation_item.to_be_dispose, to_be_repaired: @office_item_evaluation_item.to_be_repaired, total_amount: @office_item_evaluation_item.total_amount, unit: @office_item_evaluation_item.unit, unmatched: @office_item_evaluation_item.unmatched, user_id: @office_item_evaluation_item.user_id, working: @office_item_evaluation_item.working } }
    assert_redirected_to project_item_evaluation_item_url(@office_item_evaluation_item)
  end

  test "should destroy office_item_evaluation_item" do
    assert_difference('OfficeItemEvaluationItem.count', -1) do
      delete project_item_evaluation_item_url(@office_item_evaluation_item)
    end

    assert_redirected_to project_item_evaluation_items_url
  end
end
