require "application_system_test_case"

class RepairApplicationFormItemsTest < ApplicationSystemTestCase
  setup do
    @repair_application_form_item = repair_application_form_items(:one)
  end

  test "visiting the index" do
    visit repair_application_form_items_url
    assert_selector "h1", text: "Repair Application Form Items"
  end

  test "creating a Repair application form item" do
    visit repair_application_form_items_url
    click_on "New Repair Application Form Item"

    fill_in "Applicant sign", with: @repair_application_form_item.applicant_sign
    fill_in "Approx repair cost", with: @repair_application_form_item.approx_repair_cost
    fill_in "Item identification no", with: @repair_application_form_item.item_identification_no
    fill_in "Name of item", with: @repair_application_form_item.name_of_item
    fill_in "Office", with: @repair_application_form_item.office_id
    fill_in "Reason toprepair", with: @repair_application_form_item.reason_toPrepair
    fill_in "Remarks", with: @repair_application_form_item.remarks
    fill_in "Repair application form", with: @repair_application_form_item.repair_application_form_id
    fill_in "User", with: @repair_application_form_item.user_id
    click_on "Create Repair application form item"

    assert_text "Repair application form item was successfully created"
    click_on "Back"
  end

  test "updating a Repair application form item" do
    visit repair_application_form_items_url
    click_on "Edit", match: :first

    fill_in "Applicant sign", with: @repair_application_form_item.applicant_sign
    fill_in "Approx repair cost", with: @repair_application_form_item.approx_repair_cost
    fill_in "Item identification no", with: @repair_application_form_item.item_identification_no
    fill_in "Name of item", with: @repair_application_form_item.name_of_item
    fill_in "Office", with: @repair_application_form_item.office_id
    fill_in "Reason toprepair", with: @repair_application_form_item.reason_toPrepair
    fill_in "Remarks", with: @repair_application_form_item.remarks
    fill_in "Repair application form", with: @repair_application_form_item.repair_application_form_id
    fill_in "User", with: @repair_application_form_item.user_id
    click_on "Update Repair application form item"

    assert_text "Repair application form item was successfully updated"
    click_on "Back"
  end

  test "destroying a Repair application form item" do
    visit repair_application_form_items_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Repair application form item was successfully destroyed"
  end
end
