require 'test_helper'

class ProjectPurchaseTendersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @project_purchase_tender = project_purchase_tenders(:one)
  end

  test "should get index" do
    get project_tenders_url
    assert_response :success
  end

  test "should get new" do
    get new_project_tender_url
    assert_response :success
  end

  test "should create project_purchase_tender" do
    assert_difference('ProjectTender.count') do
      post project_tenders_url, params: {project_purchase_tender: {bidders_address: @project_purchase_tender.bidders_address, bidders_name: @project_purchase_tender.bidders_name, fiscal_yeaer_id: @project_purchase_tender.fiscal_yeaer_id, marked_as_final: @project_purchase_tender.marked_as_final, office_id: @project_purchase_tender.office_id, tender_date: @project_purchase_tender.tender_date, tender_name: @project_purchase_tender.tender_name, tender_no: @project_purchase_tender.tender_no, user_id: @project_purchase_tender.user_id } }
    end

    assert_redirected_to project_tender_url(ProjectTender.last)
  end

  test "should show project_purchase_tender" do
    get project_tender_url(@project_purchase_tender)
    assert_response :success
  end

  test "should get edit" do
    get edit_project_tender_url(@project_purchase_tender)
    assert_response :success
  end

  test "should update project_purchase_tender" do
    patch project_tender_url(@project_purchase_tender), params: {project_purchase_tender: {bidders_address: @project_purchase_tender.bidders_address, bidders_name: @project_purchase_tender.bidders_name, fiscal_yeaer_id: @project_purchase_tender.fiscal_yeaer_id, marked_as_final: @project_purchase_tender.marked_as_final, office_id: @project_purchase_tender.office_id, tender_date: @project_purchase_tender.tender_date, tender_name: @project_purchase_tender.tender_name, tender_no: @project_purchase_tender.tender_no, user_id: @project_purchase_tender.user_id } }
    assert_redirected_to project_tender_url(@project_purchase_tender)
  end

  test "should destroy project_purchase_tender" do
    assert_difference('ProjectTender.count', -1) do
      delete project_tender_url(@project_purchase_tender)
    end

    assert_redirected_to project_tenders_url
  end
end
