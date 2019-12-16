require "application_system_test_case"

class ProjectDemandItemsTest < ApplicationSystemTestCase
  setup do
    @project_demand_item = project_demand_items(:one)
  end

  test "visiting the index" do
    visit project_demand_items_url
    assert_selector "h1", text: "Project Demand Items"
  end

  test "creating a Project demand item" do
    visit project_demand_items_url
    click_on "New Project Demand Item"

    fill_in "Amount", with: @project_demand_item.amount
    fill_in "Fiscal year", with: @project_demand_item.fiscal_year_id
    fill_in "Fy", with: @project_demand_item.fy
    fill_in "Item", with: @project_demand_item.item_id
    fill_in "Name of item en", with: @project_demand_item.name_of_item_en
    fill_in "Name of item ne", with: @project_demand_item.name_of_item_ne
    fill_in "Office", with: @project_demand_item.office_id
    fill_in "Project demand", with: @project_demand_item.project_demand_id
    fill_in "Project", with: @project_demand_item.project_id
    fill_in "Project item", with: @project_demand_item.project_item_id
    fill_in "Quantity", with: @project_demand_item.quantity
    fill_in "Rate", with: @project_demand_item.rate
    fill_in "Remark", with: @project_demand_item.remark
    fill_in "Specification", with: @project_demand_item.specification
    fill_in "Unit en", with: @project_demand_item.unit_en
    fill_in "Unit ne", with: @project_demand_item.unit_ne
    fill_in "User", with: @project_demand_item.user_id
    click_on "Create Project demand item"

    assert_text "Project demand item was successfully created"
    click_on "Back"
  end

  test "updating a Project demand item" do
    visit project_demand_items_url
    click_on "Edit", match: :first

    fill_in "Amount", with: @project_demand_item.amount
    fill_in "Fiscal year", with: @project_demand_item.fiscal_year_id
    fill_in "Fy", with: @project_demand_item.fy
    fill_in "Item", with: @project_demand_item.item_id
    fill_in "Name of item en", with: @project_demand_item.name_of_item_en
    fill_in "Name of item ne", with: @project_demand_item.name_of_item_ne
    fill_in "Office", with: @project_demand_item.office_id
    fill_in "Project demand", with: @project_demand_item.project_demand_id
    fill_in "Project", with: @project_demand_item.project_id
    fill_in "Project item", with: @project_demand_item.project_item_id
    fill_in "Quantity", with: @project_demand_item.quantity
    fill_in "Rate", with: @project_demand_item.rate
    fill_in "Remark", with: @project_demand_item.remark
    fill_in "Specification", with: @project_demand_item.specification
    fill_in "Unit en", with: @project_demand_item.unit_en
    fill_in "Unit ne", with: @project_demand_item.unit_ne
    fill_in "User", with: @project_demand_item.user_id
    click_on "Update Project demand item"

    assert_text "Project demand item was successfully updated"
    click_on "Back"
  end

  test "destroying a Project demand item" do
    visit project_demand_items_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Project demand item was successfully destroyed"
  end
end
