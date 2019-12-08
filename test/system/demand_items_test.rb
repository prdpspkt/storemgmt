require "application_system_test_case"

class DemandItemsTest < ApplicationSystemTestCase
  setup do
    @demand_item = demand_items(:one)
  end

  test "visiting the index" do
    visit demand_items_url
    assert_selector "h1", text: "Demand Items"
  end

  test "creating a Demand item" do
    visit demand_items_url
    click_on "New Demand Item"

    fill_in "Demand", with: @demand_item.demand_id
    fill_in "Fiscal year", with: @demand_item.fiscal_year_id
    fill_in "Fy", with: @demand_item.fy
    fill_in "Name of item", with: @demand_item.name_of_item
    fill_in "Office", with: @demand_item.office_id
    fill_in "Office item", with: @demand_item.office_item_id
    fill_in "Quantity", with: @demand_item.quantity
    fill_in "Remark", with: @demand_item.remark
    fill_in "Specification", with: @demand_item.specification
    fill_in "Unit", with: @demand_item.unit
    fill_in "User", with: @demand_item.user_id
    click_on "Create Demand item"

    assert_text "Demand item was successfully created"
    click_on "Back"
  end

  test "updating a Demand item" do
    visit demand_items_url
    click_on "Edit", match: :first

    fill_in "Demand", with: @demand_item.demand_id
    fill_in "Fiscal year", with: @demand_item.fiscal_year_id
    fill_in "Fy", with: @demand_item.fy
    fill_in "Name of item", with: @demand_item.name_of_item
    fill_in "Office", with: @demand_item.office_id
    fill_in "Office item", with: @demand_item.office_item_id
    fill_in "Quantity", with: @demand_item.quantity
    fill_in "Remark", with: @demand_item.remark
    fill_in "Specification", with: @demand_item.specification
    fill_in "Unit", with: @demand_item.unit
    fill_in "User", with: @demand_item.user_id
    click_on "Update Demand item"

    assert_text "Demand item was successfully updated"
    click_on "Back"
  end

  test "destroying a Demand item" do
    visit demand_items_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Demand item was successfully destroyed"
  end
end
