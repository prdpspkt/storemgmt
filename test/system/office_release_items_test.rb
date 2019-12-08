require "application_system_test_case"

class OfficeReleaseItemsTest < ApplicationSystemTestCase
  setup do
    @office_release_item = office_release_items(:one)
  end

  test "visiting the index" do
    visit office_release_items_url
    assert_selector "h1", text: "Office Release Items"
  end

  test "creating a Office release item" do
    visit office_release_items_url
    click_on "New Office Release Item"

    fill_in "Amount", with: @office_release_item.amount
    fill_in "Code no", with: @office_release_item.code_no
    fill_in "Fiscal year", with: @office_release_item.fiscal_year_id
    fill_in "Item register page no", with: @office_release_item.item_register_page_no
    fill_in "Name of item", with: @office_release_item.name_of_item
    fill_in "Office", with: @office_release_item.office_id
    fill_in "Office release", with: @office_release_item.office_release_id
    fill_in "Quantity", with: @office_release_item.quantity
    fill_in "Rate", with: @office_release_item.rate
    fill_in "Remarks", with: @office_release_item.remarks
    fill_in "Specification", with: @office_release_item.specification
    fill_in "Unit", with: @office_release_item.unit
    fill_in "User", with: @office_release_item.user_id
    click_on "Create Office release item"

    assert_text "Office release item was successfully created"
    click_on "Back"
  end

  test "updating a Office release item" do
    visit office_release_items_url
    click_on "Edit", match: :first

    fill_in "Amount", with: @office_release_item.amount
    fill_in "Code no", with: @office_release_item.code_no
    fill_in "Fiscal year", with: @office_release_item.fiscal_year_id
    fill_in "Item register page no", with: @office_release_item.item_register_page_no
    fill_in "Name of item", with: @office_release_item.name_of_item
    fill_in "Office", with: @office_release_item.office_id
    fill_in "Office release", with: @office_release_item.office_release_id
    fill_in "Quantity", with: @office_release_item.quantity
    fill_in "Rate", with: @office_release_item.rate
    fill_in "Remarks", with: @office_release_item.remarks
    fill_in "Specification", with: @office_release_item.specification
    fill_in "Unit", with: @office_release_item.unit
    fill_in "User", with: @office_release_item.user_id
    click_on "Update Office release item"

    assert_text "Office release item was successfully updated"
    click_on "Back"
  end

  test "destroying a Office release item" do
    visit office_release_items_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Office release item was successfully destroyed"
  end
end
