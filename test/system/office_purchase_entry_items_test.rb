require "application_system_test_case"

class OfficePurchaseEntryItemsTest < ApplicationSystemTestCase
  setup do
    @office_purchase_entry_item = office_purchase_entry_items(:one)
  end

  test "visiting the index" do
    visit office_purchase_entry_items_url
    assert_selector "h1", text: "Office Purchase Entry Items"
  end

  test "creating a Office purchase entry item" do
    visit office_purchase_entry_items_url
    click_on "New Office Purchase Entry Item"

    fill_in "Amount", with: @office_purchase_entry_item.amount
    fill_in "Amount without vat", with: @office_purchase_entry_item.amount_without_vat
    fill_in "Fiscal year", with: @office_purchase_entry_item.fiscal_year
    fill_in "Fy", with: @office_purchase_entry_item.fy
    fill_in "Item classification no", with: @office_purchase_entry_item.item_classification_no
    fill_in "Item identification no", with: @office_purchase_entry_item.item_identification_no
    fill_in "Item registration page no", with: @office_purchase_entry_item.item_registration_page_no
    fill_in "Model no", with: @office_purchase_entry_item.model_no
    fill_in "Name of item", with: @office_purchase_entry_item.name_of_item
    fill_in "Office", with: @office_purchase_entry_item.office_id
    fill_in "Office purchase entry", with: @office_purchase_entry_item.office_purchase_entry_id
    fill_in "Other expense", with: @office_purchase_entry_item.other_expense
    fill_in "Purchase handover no", with: @office_purchase_entry_item.purchase_handover_no
    fill_in "Quantity", with: @office_purchase_entry_item.quantity
    fill_in "Rate", with: @office_purchase_entry_item.rate
    fill_in "Remarks", with: @office_purchase_entry_item.remarks
    fill_in "Specification", with: @office_purchase_entry_item.specification
    fill_in "Total amount", with: @office_purchase_entry_item.total_amount
    fill_in "Unit", with: @office_purchase_entry_item.unit
    fill_in "User", with: @office_purchase_entry_item.user_id
    fill_in "Vat", with: @office_purchase_entry_item.vat
    click_on "Create Office purchase entry item"

    assert_text "Office purchase entry item was successfully created"
    click_on "Back"
  end

  test "updating a Office purchase entry item" do
    visit office_purchase_entry_items_url
    click_on "Edit", match: :first

    fill_in "Amount", with: @office_purchase_entry_item.amount
    fill_in "Amount without vat", with: @office_purchase_entry_item.amount_without_vat
    fill_in "Fiscal year", with: @office_purchase_entry_item.fiscal_year
    fill_in "Fy", with: @office_purchase_entry_item.fy
    fill_in "Item classification no", with: @office_purchase_entry_item.item_classification_no
    fill_in "Item identification no", with: @office_purchase_entry_item.item_identification_no
    fill_in "Item registration page no", with: @office_purchase_entry_item.item_registration_page_no
    fill_in "Model no", with: @office_purchase_entry_item.model_no
    fill_in "Name of item", with: @office_purchase_entry_item.name_of_item
    fill_in "Office", with: @office_purchase_entry_item.office_id
    fill_in "Office purchase entry", with: @office_purchase_entry_item.office_purchase_entry_id
    fill_in "Other expense", with: @office_purchase_entry_item.other_expense
    fill_in "Purchase handover no", with: @office_purchase_entry_item.purchase_handover_no
    fill_in "Quantity", with: @office_purchase_entry_item.quantity
    fill_in "Rate", with: @office_purchase_entry_item.rate
    fill_in "Remarks", with: @office_purchase_entry_item.remarks
    fill_in "Specification", with: @office_purchase_entry_item.specification
    fill_in "Total amount", with: @office_purchase_entry_item.total_amount
    fill_in "Unit", with: @office_purchase_entry_item.unit
    fill_in "User", with: @office_purchase_entry_item.user_id
    fill_in "Vat", with: @office_purchase_entry_item.vat
    click_on "Update Office purchase entry item"

    assert_text "Office purchase entry item was successfully updated"
    click_on "Back"
  end

  test "destroying a Office purchase entry item" do
    visit office_purchase_entry_items_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Office purchase entry item was successfully destroyed"
  end
end
