require 'test_helper'

class ProjectEntriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @project_entry = project_entries(:one)
  end

  test "should get index" do
    get project_entries_url
    assert_response :success
  end

  test "should get new" do
    get new_project_entry_url
    assert_response :success
  end

  test "should create project_entry" do
    assert_difference('ProjectEntry.count') do
      post project_entries_url, params: { project_entry: { amount: @project_entry.amount, fiscal_year_id: @project_entry.fiscal_year_id, item_register_page_no: @project_entry.item_register_page_no, office_id: @project_entry.office_id, project_entry_item_id: @project_entry.project_entry_item_id, quantity: @project_entry.quantity, rate: @project_entry.rate, released_to: @project_entry.released_to, user_id: @project_entry.user_id } }
    end

    assert_redirected_to project_entry_url(ProjectEntry.last)
  end

  test "should show project_entry" do
    get project_entry_url(@project_entry)
    assert_response :success
  end

  test "should get edit" do
    get edit_project_entry_url(@project_entry)
    assert_response :success
  end

  test "should update project_entry" do
    patch project_entry_url(@project_entry), params: { project_entry: { amount: @project_entry.amount, fiscal_year_id: @project_entry.fiscal_year_id, item_register_page_no: @project_entry.item_register_page_no, office_id: @project_entry.office_id, project_entry_item_id: @project_entry.project_entry_item_id, quantity: @project_entry.quantity, rate: @project_entry.rate, released_to: @project_entry.released_to, user_id: @project_entry.user_id } }
    assert_redirected_to project_entry_url(@project_entry)
  end

  test "should destroy project_entry" do
    assert_difference('ProjectEntry.count', -1) do
      delete project_entry_url(@project_entry)
    end

    assert_redirected_to project_entries_url
  end
end
