require "application_system_test_case"

class ProjectItemStocksTest < ApplicationSystemTestCase
  setup do
    @project_item_stock = project_item_stocks(:one)
  end

  test "visiting the index" do
    visit project_item_stocks_url
    assert_selector "h1", text: "Project Item Stocks"
  end

  test "creating a Project item stock" do
    visit project_item_stocks_url
    click_on "New Project Item Stock"

    fill_in "Amount", with: @project_item_stock.amount
    fill_in "Fiscal year", with: @project_item_stock.fiscal_year_id
    fill_in "Item", with: @project_item_stock.item_id
    fill_in "Office", with: @project_item_stock.office_id
    fill_in "Project item", with: @project_item_stock.project_item_id
    fill_in "Quantity", with: @project_item_stock.quantity
    fill_in "Rate", with: @project_item_stock.rate
    fill_in "User", with: @project_item_stock.user_id
    click_on "Create Project item stock"

    assert_text "Project item stock was successfully created"
    click_on "Back"
  end

  test "updating a Project item stock" do
    visit project_item_stocks_url
    click_on "Edit", match: :first

    fill_in "Amount", with: @project_item_stock.amount
    fill_in "Fiscal year", with: @project_item_stock.fiscal_year_id
    fill_in "Item", with: @project_item_stock.item_id
    fill_in "Office", with: @project_item_stock.office_id
    fill_in "Project item", with: @project_item_stock.project_item_id
    fill_in "Quantity", with: @project_item_stock.quantity
    fill_in "Rate", with: @project_item_stock.rate
    fill_in "User", with: @project_item_stock.user_id
    click_on "Update Project item stock"

    assert_text "Project item stock was successfully updated"
    click_on "Back"
  end

  test "destroying a Project item stock" do
    visit project_item_stocks_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Project item stock was successfully destroyed"
  end
end
