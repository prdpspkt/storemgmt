require 'test_helper'

class ProjectPurchaseEntriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @project_purchase_entry = project_purchase_entries(:one)
  end

  test "should get index" do
    get project_purchase_entries_url
    assert_response :success
  end

  test "should get new" do
    get new_project_purchase_entry_url
    assert_response :success
  end

  test "should create project_purchase_entry" do
    assert_difference('ProjectPurchaseEntry.count') do
      post project_purchase_entries_url, params: { project_purchase_entry: { bill_no: @project_purchase_entry.bill_no, entry_date: @project_purchase_entry.entry_date, entry_no: @project_purchase_entry.entry_no, fiscal_year_id: @project_purchase_entry.fiscal_year_id, fy: @project_purchase_entry.fy, item_id: @project_purchase_entry.item_id, item_register_page_no: @project_purchase_entry.item_register_page_no, marked_as_final: @project_purchase_entry.marked_as_final, office_chief_designation: @project_purchase_entry.office_chief_designation, office_chief_name: @project_purchase_entry.office_chief_name, office_chief_signed_date: @project_purchase_entry.office_chief_signed_date, office_id: @project_purchase_entry.office_id, purchase_handover_no: @project_purchase_entry.purchase_handover_no, section_chief_designation: @project_purchase_entry.section_chief_designation, section_chief_name: @project_purchase_entry.section_chief_name, section_chief_signed_date: @project_purchase_entry.section_chief_signed_date, store_chief_designation: @project_purchase_entry.store_chief_designation, store_chief_name: @project_purchase_entry.store_chief_name, store_chief_signed_date: @project_purchase_entry.store_chief_signed_date, user_id: @project_purchase_entry.user_id } }
    end

    assert_redirected_to project_purchase_entry_url(ProjectPurchaseEntry.last)
  end

  test "should show project_purchase_entry" do
    get project_purchase_entry_url(@project_purchase_entry)
    assert_response :success
  end

  test "should get edit" do
    get edit_project_purchase_entry_url(@project_purchase_entry)
    assert_response :success
  end

  test "should update project_purchase_entry" do
    patch project_purchase_entry_url(@project_purchase_entry), params: { project_purchase_entry: { bill_no: @project_purchase_entry.bill_no, entry_date: @project_purchase_entry.entry_date, entry_no: @project_purchase_entry.entry_no, fiscal_year_id: @project_purchase_entry.fiscal_year_id, fy: @project_purchase_entry.fy, item_id: @project_purchase_entry.item_id, item_register_page_no: @project_purchase_entry.item_register_page_no, marked_as_final: @project_purchase_entry.marked_as_final, office_chief_designation: @project_purchase_entry.office_chief_designation, office_chief_name: @project_purchase_entry.office_chief_name, office_chief_signed_date: @project_purchase_entry.office_chief_signed_date, office_id: @project_purchase_entry.office_id, purchase_handover_no: @project_purchase_entry.purchase_handover_no, section_chief_designation: @project_purchase_entry.section_chief_designation, section_chief_name: @project_purchase_entry.section_chief_name, section_chief_signed_date: @project_purchase_entry.section_chief_signed_date, store_chief_designation: @project_purchase_entry.store_chief_designation, store_chief_name: @project_purchase_entry.store_chief_name, store_chief_signed_date: @project_purchase_entry.store_chief_signed_date, user_id: @project_purchase_entry.user_id } }
    assert_redirected_to project_purchase_entry_url(@project_purchase_entry)
  end

  test "should destroy project_purchase_entry" do
    assert_difference('ProjectPurchaseEntry.count', -1) do
      delete project_purchase_entry_url(@project_purchase_entry)
    end

    assert_redirected_to project_purchase_entries_url
  end
end
