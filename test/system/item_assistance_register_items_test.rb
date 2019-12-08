require "application_system_test_case"

class ItemAssistanceRegisterItemsTest < ApplicationSystemTestCase
  setup do
    @item_assistance_register_item = item_assistance_register_items(:one)
  end

  test "visiting the index" do
    visit item_assistance_register_items_url
    assert_selector "h1", text: "Item Assistance Register Items"
  end

  test "creating a Item assistance register item" do
    visit item_assistance_register_items_url
    click_on "New Item Assistance Register Item"

    fill_in "Amount", with: @item_assistance_register_item.amount
    fill_in "Date", with: @item_assistance_register_item.date
    fill_in "Date to be returned", with: @item_assistance_register_item.date_to_be_returned
    fill_in "Fiscal year", with: @item_assistance_register_item.fiscal_year_id
    fill_in "Fy", with: @item_assistance_register_item.fy
    fill_in "Item identification no", with: @item_assistance_register_item.item_identification_no
    fill_in "Model no", with: @item_assistance_register_item.model_no
    fill_in "Name of item", with: @item_assistance_register_item.name_of_item
    fill_in "Name of user", with: @item_assistance_register_item.name_of_user
    fill_in "Office", with: @item_assistance_register_item.office_id
    fill_in "Order release no", with: @item_assistance_register_item.order_release_no
    fill_in "Quantity", with: @item_assistance_register_item.quantity
    fill_in "Returned date", with: @item_assistance_register_item.returned_date
    fill_in "Returned quantity", with: @item_assistance_register_item.returned_quantity
    fill_in "Specification", with: @item_assistance_register_item.specification
    fill_in "Taken date", with: @item_assistance_register_item.taken_date
    fill_in "User", with: @item_assistance_register_item.user_id
    click_on "Create Item assistance register item"

    assert_text "Item assistance register item was successfully created"
    click_on "Back"
  end

  test "updating a Item assistance register item" do
    visit item_assistance_register_items_url
    click_on "Edit", match: :first

    fill_in "Amount", with: @item_assistance_register_item.amount
    fill_in "Date", with: @item_assistance_register_item.date
    fill_in "Date to be returned", with: @item_assistance_register_item.date_to_be_returned
    fill_in "Fiscal year", with: @item_assistance_register_item.fiscal_year_id
    fill_in "Fy", with: @item_assistance_register_item.fy
    fill_in "Item identification no", with: @item_assistance_register_item.item_identification_no
    fill_in "Model no", with: @item_assistance_register_item.model_no
    fill_in "Name of item", with: @item_assistance_register_item.name_of_item
    fill_in "Name of user", with: @item_assistance_register_item.name_of_user
    fill_in "Office", with: @item_assistance_register_item.office_id
    fill_in "Order release no", with: @item_assistance_register_item.order_release_no
    fill_in "Quantity", with: @item_assistance_register_item.quantity
    fill_in "Returned date", with: @item_assistance_register_item.returned_date
    fill_in "Returned quantity", with: @item_assistance_register_item.returned_quantity
    fill_in "Specification", with: @item_assistance_register_item.specification
    fill_in "Taken date", with: @item_assistance_register_item.taken_date
    fill_in "User", with: @item_assistance_register_item.user_id
    click_on "Update Item assistance register item"

    assert_text "Item assistance register item was successfully updated"
    click_on "Back"
  end

  test "destroying a Item assistance register item" do
    visit item_assistance_register_items_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Item assistance register item was successfully destroyed"
  end
end
