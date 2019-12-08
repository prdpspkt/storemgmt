require "application_system_test_case"

class OfficeItemsTest < ApplicationSystemTestCase
  setup do
    @office_item = office_items(:one)
  end

  test "visiting the index" do
    visit office_items_url
    assert_selector "h1", text: "Office Items"
  end

  test "creating a Office item" do
    visit office_items_url
    click_on "New Office Item"

    fill_in "Fy", with: @office_item.fy_id
    fill_in "Item", with: @office_item.item_id
    fill_in "Item register page no", with: @office_item.item_register_page_no
    fill_in "Name of item en", with: @office_item.name_of_item_en
    fill_in "Name of item ne", with: @office_item.name_of_item_ne
    fill_in "Not working", with: @office_item.not_working
    fill_in "Office", with: @office_item.office_id
    fill_in "To be auctioned", with: @office_item.to_be_auctioned
    fill_in "To be conserved", with: @office_item.to_be_conserved
    fill_in "To be repaired", with: @office_item.to_be_repaired
    fill_in "Type", with: @office_item.type
    fill_in "Unit en", with: @office_item.unit_en
    fill_in "Unit ne", with: @office_item.unit_ne
    fill_in "User", with: @office_item.user_id
    fill_in "Working", with: @office_item.working
    click_on "Create Office item"

    assert_text "Office item was successfully created"
    click_on "Back"
  end

  test "updating a Office item" do
    visit office_items_url
    click_on "Edit", match: :first

    fill_in "Fy", with: @office_item.fy_id
    fill_in "Item", with: @office_item.item_id
    fill_in "Item register page no", with: @office_item.item_register_page_no
    fill_in "Name of item en", with: @office_item.name_of_item_en
    fill_in "Name of item ne", with: @office_item.name_of_item_ne
    fill_in "Not working", with: @office_item.not_working
    fill_in "Office", with: @office_item.office_id
    fill_in "To be auctioned", with: @office_item.to_be_auctioned
    fill_in "To be conserved", with: @office_item.to_be_conserved
    fill_in "To be repaired", with: @office_item.to_be_repaired
    fill_in "Type", with: @office_item.type
    fill_in "Unit en", with: @office_item.unit_en
    fill_in "Unit ne", with: @office_item.unit_ne
    fill_in "User", with: @office_item.user_id
    fill_in "Working", with: @office_item.working
    click_on "Update Office item"

    assert_text "Office item was successfully updated"
    click_on "Back"
  end

  test "destroying a Office item" do
    visit office_items_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Office item was successfully destroyed"
  end
end
