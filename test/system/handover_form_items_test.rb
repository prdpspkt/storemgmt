require "application_system_test_case"

class HandoverFormItemsTest < ApplicationSystemTestCase
  setup do
    @handover_form_item = handover_form_items(:one)
  end

  test "visiting the index" do
    visit handover_form_items_url
    assert_selector "h1", text: "Handover Form Items"
  end

  test "creating a Handover form item" do
    visit handover_form_items_url
    click_on "New Handover Form Item"

    fill_in "Amount", with: @handover_form_item.amount
    fill_in "Fiscal year", with: @handover_form_item.fiscal_year_id
    fill_in "Fy", with: @handover_form_item.fy
    fill_in "Handover form", with: @handover_form_item.handover_form_id
    fill_in "Item classification no", with: @handover_form_item.item_classification_no
    fill_in "Item identification no", with: @handover_form_item.item_identification_no
    fill_in "Item register page no", with: @handover_form_item.item_register_page_no
    fill_in "Model no", with: @handover_form_item.model_no
    fill_in "Name of item", with: @handover_form_item.name_of_item
    fill_in "Office", with: @handover_form_item.office_id
    fill_in "Physical status", with: @handover_form_item.physical_status
    fill_in "Project", with: @handover_form_item.project_id
    fill_in "Quantity", with: @handover_form_item.quantity
    fill_in "Received date", with: @handover_form_item.received_date
    fill_in "Specification", with: @handover_form_item.specification
    fill_in "Unit", with: @handover_form_item.unit
    fill_in "User", with: @handover_form_item.user_id
    click_on "Create Handover form item"

    assert_text "Handover form item was successfully created"
    click_on "Back"
  end

  test "updating a Handover form item" do
    visit handover_form_items_url
    click_on "Edit", match: :first

    fill_in "Amount", with: @handover_form_item.amount
    fill_in "Fiscal year", with: @handover_form_item.fiscal_year_id
    fill_in "Fy", with: @handover_form_item.fy
    fill_in "Handover form", with: @handover_form_item.handover_form_id
    fill_in "Item classification no", with: @handover_form_item.item_classification_no
    fill_in "Item identification no", with: @handover_form_item.item_identification_no
    fill_in "Item register page no", with: @handover_form_item.item_register_page_no
    fill_in "Model no", with: @handover_form_item.model_no
    fill_in "Name of item", with: @handover_form_item.name_of_item
    fill_in "Office", with: @handover_form_item.office_id
    fill_in "Physical status", with: @handover_form_item.physical_status
    fill_in "Project", with: @handover_form_item.project_id
    fill_in "Quantity", with: @handover_form_item.quantity
    fill_in "Received date", with: @handover_form_item.received_date
    fill_in "Specification", with: @handover_form_item.specification
    fill_in "Unit", with: @handover_form_item.unit
    fill_in "User", with: @handover_form_item.user_id
    click_on "Update Handover form item"

    assert_text "Handover form item was successfully updated"
    click_on "Back"
  end

  test "destroying a Handover form item" do
    visit handover_form_items_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Handover form item was successfully destroyed"
  end
end
