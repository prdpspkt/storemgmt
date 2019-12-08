require 'test_helper'

class ItemDisposalsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @item_disposal = item_disposals(:one)
  end

  test "should get index" do
    get item_disposals_url
    assert_response :success
  end

  test "should get new" do
    get new_item_disposal_url
    assert_response :success
  end

  test "should create item_disposal" do
    assert_difference('ItemDisposal.count') do
      post item_disposals_url, params: { item_disposal: { decision_date: @item_disposal.decision_date, decision_made_by: @item_disposal.decision_made_by, fiscal_year_id: @item_disposal.fiscal_year_id, fy: @item_disposal.fy, office_chief_designation: @item_disposal.office_chief_designation, office_chief_name: @item_disposal.office_chief_name, office_chief_signed_date: @item_disposal.office_chief_signed_date, office_id: @item_disposal.office_id, section_chief_designation: @item_disposal.section_chief_designation, section_chief_name: @item_disposal.section_chief_name, section_chief_signed_date: @item_disposal.section_chief_signed_date, store_chief_designation: @item_disposal.store_chief_designation, store_chief_name: @item_disposal.store_chief_name, store_chief_signed_date: @item_disposal.store_chief_signed_date, user_id: @item_disposal.user_id } }
    end

    assert_redirected_to item_disposal_url(ItemDisposal.last)
  end

  test "should show item_disposal" do
    get item_disposal_url(@item_disposal)
    assert_response :success
  end

  test "should get edit" do
    get edit_item_disposal_url(@item_disposal)
    assert_response :success
  end

  test "should update item_disposal" do
    patch item_disposal_url(@item_disposal), params: { item_disposal: { decision_date: @item_disposal.decision_date, decision_made_by: @item_disposal.decision_made_by, fiscal_year_id: @item_disposal.fiscal_year_id, fy: @item_disposal.fy, office_chief_designation: @item_disposal.office_chief_designation, office_chief_name: @item_disposal.office_chief_name, office_chief_signed_date: @item_disposal.office_chief_signed_date, office_id: @item_disposal.office_id, section_chief_designation: @item_disposal.section_chief_designation, section_chief_name: @item_disposal.section_chief_name, section_chief_signed_date: @item_disposal.section_chief_signed_date, store_chief_designation: @item_disposal.store_chief_designation, store_chief_name: @item_disposal.store_chief_name, store_chief_signed_date: @item_disposal.store_chief_signed_date, user_id: @item_disposal.user_id } }
    assert_redirected_to item_disposal_url(@item_disposal)
  end

  test "should destroy item_disposal" do
    assert_difference('ItemDisposal.count', -1) do
      delete item_disposal_url(@item_disposal)
    end

    assert_redirected_to item_disposals_url
  end
end
