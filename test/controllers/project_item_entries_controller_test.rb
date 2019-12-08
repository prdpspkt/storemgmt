require 'test_helper'

class ProjectItemEntriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @project_item_entry = project_item_entries(:one)
  end

  test "should get index" do
    get project_item_entries_url
    assert_response :success
  end

  test "should get new" do
    get new_project_item_entry_url
    assert_response :success
  end

  test "should create project_item_entry" do
    assert_difference('ProjectItemEntry.count') do
      post project_item_entries_url, params: { project_item_entry: { amount: @project_item_entry.amount, fiscal_year_id: @project_item_entry.fiscal_year_id, item_register_page_no: @project_item_entry.item_register_page_no, office_id: @project_item_entry.office_id, project_entry_item_id: @project_item_entry.project_entry_item_id, project_id: @project_item_entry.project_id, project_item_id: @project_item_entry.project_item_id, project_wise_item_register_page_no: @project_item_entry.project_wise_item_register_page_no, quantity: @project_item_entry.quantity, rate: @project_item_entry.rate, released_to: @project_item_entry.released_to, user_id: @project_item_entry.user_id } }
    end

    assert_redirected_to project_item_entry_url(ProjectItemEntry.last)
  end

  test "should show project_item_entry" do
    get project_item_entry_url(@project_item_entry)
    assert_response :success
  end

  test "should get edit" do
    get edit_project_item_entry_url(@project_item_entry)
    assert_response :success
  end

  test "should update project_item_entry" do
    patch project_item_entry_url(@project_item_entry), params: { project_item_entry: { amount: @project_item_entry.amount, fiscal_year_id: @project_item_entry.fiscal_year_id, item_register_page_no: @project_item_entry.item_register_page_no, office_id: @project_item_entry.office_id, project_entry_item_id: @project_item_entry.project_entry_item_id, project_id: @project_item_entry.project_id, project_item_id: @project_item_entry.project_item_id, project_wise_item_register_page_no: @project_item_entry.project_wise_item_register_page_no, quantity: @project_item_entry.quantity, rate: @project_item_entry.rate, released_to: @project_item_entry.released_to, user_id: @project_item_entry.user_id } }
    assert_redirected_to project_item_entry_url(@project_item_entry)
  end

  test "should destroy project_item_entry" do
    assert_difference('ProjectItemEntry.count', -1) do
      delete project_item_entry_url(@project_item_entry)
    end

    assert_redirected_to project_item_entries_url
  end
end
