require "application_system_test_case"

class NameOfItemsTest < ApplicationSystemTestCase
  setup do
    @name_of_item = name_of_items(:one)
  end

  test "visiting the index" do
    visit name_of_items_url
    assert_selector "h1", text: "Name Of Items"
  end

  test "creating a Name of item" do
    visit name_of_items_url
    click_on "New Name Of Item"

    fill_in "Applicant sign", with: @name_of_item.applicant_sign
    fill_in "Approx repair cost", with: @name_of_item.approx_repair_cost
    fill_in "Item identification no", with: @name_of_item.item_identification_no
    fill_in "Office", with: @name_of_item.office_id
    fill_in "Reason toprepair", with: @name_of_item.reason_toPrepair
    fill_in "Remarks", with: @name_of_item.remarks
    fill_in "Repair application form", with: @name_of_item.repair_application_form_id
    fill_in "User", with: @name_of_item.user_id
    click_on "Create Name of item"

    assert_text "Name of item was successfully created"
    click_on "Back"
  end

  test "updating a Name of item" do
    visit name_of_items_url
    click_on "Edit", match: :first

    fill_in "Applicant sign", with: @name_of_item.applicant_sign
    fill_in "Approx repair cost", with: @name_of_item.approx_repair_cost
    fill_in "Item identification no", with: @name_of_item.item_identification_no
    fill_in "Office", with: @name_of_item.office_id
    fill_in "Reason toprepair", with: @name_of_item.reason_toPrepair
    fill_in "Remarks", with: @name_of_item.remarks
    fill_in "Repair application form", with: @name_of_item.repair_application_form_id
    fill_in "User", with: @name_of_item.user_id
    click_on "Update Name of item"

    assert_text "Name of item was successfully updated"
    click_on "Back"
  end

  test "destroying a Name of item" do
    visit name_of_items_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Name of item was successfully destroyed"
  end
end
