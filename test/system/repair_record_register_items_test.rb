require "application_system_test_case"

class RepairRecordRegisterItemsTest < ApplicationSystemTestCase
  setup do
    @repair_record_register_item = repair_record_register_items(:one)
  end

  test "visiting the index" do
    visit repair_record_register_items_url
    assert_selector "h1", text: "Repair Record Register Items"
  end

  test "creating a Repair record register item" do
    visit repair_record_register_items_url
    click_on "New Repair Record Register Item"

    fill_in "Applicat name", with: @repair_record_register_item.applicat_name
    fill_in "Changed part name", with: @repair_record_register_item.changed_part_name
    fill_in "Changesd part cost", with: @repair_record_register_item.changesd_part_cost
    fill_in "Date", with: @repair_record_register_item.date
    fill_in "Fiscal year", with: @repair_record_register_item.fiscal_year_id
    fill_in "Fy", with: @repair_record_register_item.fy
    fill_in "Justified by", with: @repair_record_register_item.justified_by
    fill_in "Office", with: @repair_record_register_item.office_id
    fill_in "Other expense", with: @repair_record_register_item.other_expense
    fill_in "Other expense cost", with: @repair_record_register_item.other_expense_cost
    fill_in "Remarks", with: @repair_record_register_item.remarks
    fill_in "Repair application no", with: @repair_record_register_item.repair_application_no
    fill_in "Repair record register", with: @repair_record_register_item.repair_record_register_id
    fill_in "Total expense", with: @repair_record_register_item.total_expense
    fill_in "User", with: @repair_record_register_item.user_id
    fill_in "Vendor name", with: @repair_record_register_item.vendor_name
    click_on "Create Repair record register item"

    assert_text "Repair record register item was successfully created"
    click_on "Back"
  end

  test "updating a Repair record register item" do
    visit repair_record_register_items_url
    click_on "Edit", match: :first

    fill_in "Applicat name", with: @repair_record_register_item.applicat_name
    fill_in "Changed part name", with: @repair_record_register_item.changed_part_name
    fill_in "Changesd part cost", with: @repair_record_register_item.changesd_part_cost
    fill_in "Date", with: @repair_record_register_item.date
    fill_in "Fiscal year", with: @repair_record_register_item.fiscal_year_id
    fill_in "Fy", with: @repair_record_register_item.fy
    fill_in "Justified by", with: @repair_record_register_item.justified_by
    fill_in "Office", with: @repair_record_register_item.office_id
    fill_in "Other expense", with: @repair_record_register_item.other_expense
    fill_in "Other expense cost", with: @repair_record_register_item.other_expense_cost
    fill_in "Remarks", with: @repair_record_register_item.remarks
    fill_in "Repair application no", with: @repair_record_register_item.repair_application_no
    fill_in "Repair record register", with: @repair_record_register_item.repair_record_register_id
    fill_in "Total expense", with: @repair_record_register_item.total_expense
    fill_in "User", with: @repair_record_register_item.user_id
    fill_in "Vendor name", with: @repair_record_register_item.vendor_name
    click_on "Update Repair record register item"

    assert_text "Repair record register item was successfully updated"
    click_on "Back"
  end

  test "destroying a Repair record register item" do
    visit repair_record_register_items_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Repair record register item was successfully destroyed"
  end
end
