require 'test_helper'

class RepairRecordRegisterItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @repair_record_register_item = repair_record_register_items(:one)
  end

  test "should get index" do
    get repair_record_register_items_url
    assert_response :success
  end

  test "should get new" do
    get new_repair_record_register_item_url
    assert_response :success
  end

  test "should create repair_record_register_item" do
    assert_difference('RepairRecordRegisterItem.count') do
      post repair_record_register_items_url, params: { repair_record_register_item: { applicat_name: @repair_record_register_item.applicat_name, changed_part_name: @repair_record_register_item.changed_part_name, changesd_part_cost: @repair_record_register_item.changesd_part_cost, date: @repair_record_register_item.date, fiscal_year_id: @repair_record_register_item.fiscal_year_id, fy: @repair_record_register_item.fy, justified_by: @repair_record_register_item.justified_by, office_id: @repair_record_register_item.office_id, other_expense: @repair_record_register_item.other_expense, other_expense_cost: @repair_record_register_item.other_expense_cost, remarks: @repair_record_register_item.remarks, repair_application_no: @repair_record_register_item.repair_application_no, repair_record_register_id: @repair_record_register_item.repair_record_register_id, total_expense: @repair_record_register_item.total_expense, user_id: @repair_record_register_item.user_id, vendor_name: @repair_record_register_item.vendor_name } }
    end

    assert_redirected_to repair_record_register_item_url(RepairRecordRegisterItem.last)
  end

  test "should show repair_record_register_item" do
    get repair_record_register_item_url(@repair_record_register_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_repair_record_register_item_url(@repair_record_register_item)
    assert_response :success
  end

  test "should update repair_record_register_item" do
    patch repair_record_register_item_url(@repair_record_register_item), params: { repair_record_register_item: { applicat_name: @repair_record_register_item.applicat_name, changed_part_name: @repair_record_register_item.changed_part_name, changesd_part_cost: @repair_record_register_item.changesd_part_cost, date: @repair_record_register_item.date, fiscal_year_id: @repair_record_register_item.fiscal_year_id, fy: @repair_record_register_item.fy, justified_by: @repair_record_register_item.justified_by, office_id: @repair_record_register_item.office_id, other_expense: @repair_record_register_item.other_expense, other_expense_cost: @repair_record_register_item.other_expense_cost, remarks: @repair_record_register_item.remarks, repair_application_no: @repair_record_register_item.repair_application_no, repair_record_register_id: @repair_record_register_item.repair_record_register_id, total_expense: @repair_record_register_item.total_expense, user_id: @repair_record_register_item.user_id, vendor_name: @repair_record_register_item.vendor_name } }
    assert_redirected_to repair_record_register_item_url(@repair_record_register_item)
  end

  test "should destroy repair_record_register_item" do
    assert_difference('RepairRecordRegisterItem.count', -1) do
      delete repair_record_register_item_url(@repair_record_register_item)
    end

    assert_redirected_to repair_record_register_items_url
  end
end
