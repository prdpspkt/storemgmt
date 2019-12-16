require "application_system_test_case"

class OfficeItemEvaluationItemsTest < ApplicationSystemTestCase
  setup do
    @office_item_evaluation_item = office_item_evaluation_items(:one)
  end

  test "visiting the index" do
    visit project_item_evaluation_items_url
    assert_selector "h1", text: "Office Item Evaluation Items"
  end

  test "creating a Office item evaluation item" do
    visit project_item_evaluation_items_url
    click_on "New Office Item Evaluation Item"

    fill_in "Amount", with: @office_item_evaluation_item.amount
    fill_in "Decreased increased quantity", with: @office_item_evaluation_item.decreased_increased_quantity
    fill_in "Decreased quantity", with: @office_item_evaluation_item.decreased_quantity
    fill_in "Fiscal year", with: @office_item_evaluation_item.fiscal_year_id
    fill_in "Fy", with: @office_item_evaluation_item.fy
    fill_in "Increased quantity", with: @office_item_evaluation_item.increased_quantity
    fill_in "Item classification no", with: @office_item_evaluation_item.item_classification_no
    fill_in "Item", with: @office_item_evaluation_item.item_id
    fill_in "Item register page no", with: @office_item_evaluation_item.item_register_page_no
    fill_in "Mached", with: @office_item_evaluation_item.mached
    fill_in "Name of item", with: @office_item_evaluation_item.name_of_item
    fill_in "Notworking", with: @office_item_evaluation_item.notworking
    fill_in "Office", with: @office_item_evaluation_item.office_id
    fill_in "Office item", with: @office_item_evaluation_item.office_item_id
    fill_in "Quantity", with: @office_item_evaluation_item.quantity
    fill_in "Remarks", with: @office_item_evaluation_item.remarks
    fill_in "To be auctioned", with: @office_item_evaluation_item.to_be_auctioned
    fill_in "To be conserved", with: @office_item_evaluation_item.to_be_conserved
    fill_in "To be dispose", with: @office_item_evaluation_item.to_be_dispose
    fill_in "To be repaired", with: @office_item_evaluation_item.to_be_repaired
    fill_in "Total amount", with: @office_item_evaluation_item.total_amount
    fill_in "Unit", with: @office_item_evaluation_item.unit
    fill_in "Unmatched", with: @office_item_evaluation_item.unmatched
    fill_in "User", with: @office_item_evaluation_item.user_id
    fill_in "Working", with: @office_item_evaluation_item.working
    click_on "Create Office item evaluation item"

    assert_text "Office item evaluation item was successfully created"
    click_on "Back"
  end

  test "updating a Office item evaluation item" do
    visit project_item_evaluation_items_url
    click_on "Edit", match: :first

    fill_in "Amount", with: @office_item_evaluation_item.amount
    fill_in "Decreased increased quantity", with: @office_item_evaluation_item.decreased_increased_quantity
    fill_in "Decreased quantity", with: @office_item_evaluation_item.decreased_quantity
    fill_in "Fiscal year", with: @office_item_evaluation_item.fiscal_year_id
    fill_in "Fy", with: @office_item_evaluation_item.fy
    fill_in "Increased quantity", with: @office_item_evaluation_item.increased_quantity
    fill_in "Item classification no", with: @office_item_evaluation_item.item_classification_no
    fill_in "Item", with: @office_item_evaluation_item.item_id
    fill_in "Item register page no", with: @office_item_evaluation_item.item_register_page_no
    fill_in "Mached", with: @office_item_evaluation_item.mached
    fill_in "Name of item", with: @office_item_evaluation_item.name_of_item
    fill_in "Notworking", with: @office_item_evaluation_item.notworking
    fill_in "Office", with: @office_item_evaluation_item.office_id
    fill_in "Office item", with: @office_item_evaluation_item.office_item_id
    fill_in "Quantity", with: @office_item_evaluation_item.quantity
    fill_in "Remarks", with: @office_item_evaluation_item.remarks
    fill_in "To be auctioned", with: @office_item_evaluation_item.to_be_auctioned
    fill_in "To be conserved", with: @office_item_evaluation_item.to_be_conserved
    fill_in "To be dispose", with: @office_item_evaluation_item.to_be_dispose
    fill_in "To be repaired", with: @office_item_evaluation_item.to_be_repaired
    fill_in "Total amount", with: @office_item_evaluation_item.total_amount
    fill_in "Unit", with: @office_item_evaluation_item.unit
    fill_in "Unmatched", with: @office_item_evaluation_item.unmatched
    fill_in "User", with: @office_item_evaluation_item.user_id
    fill_in "Working", with: @office_item_evaluation_item.working
    click_on "Update Office item evaluation item"

    assert_text "Office item evaluation item was successfully updated"
    click_on "Back"
  end

  test "destroying a Office item evaluation item" do
    visit project_item_evaluation_items_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Office item evaluation item was successfully destroyed"
  end
end
