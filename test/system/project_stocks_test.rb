require "application_system_test_case"

class ProjectStocksTest < ApplicationSystemTestCase
  setup do
    @project_stock = project_stocks(:one)
  end

  test "visiting the index" do
    visit project_stocks_url
    assert_selector "h1", text: "Project Stocks"
  end

  test "creating a Project stock" do
    visit project_stocks_url
    click_on "New Project Stock"

    fill_in "Fiscal year", with: @project_stock.fiscal_year_id
    fill_in "Fy", with: @project_stock.fy
    fill_in "Office chief designation", with: @project_stock.office_chief_designation
    fill_in "Office chief name", with: @project_stock.office_chief_name
    fill_in "Office chief signed date", with: @project_stock.office_chief_signed_date
    fill_in "Office", with: @project_stock.office_id
    fill_in "Section chief designation", with: @project_stock.section_chief_designation
    fill_in "Section chief name", with: @project_stock.section_chief_name
    fill_in "Section chief signed date", with: @project_stock.section_chief_signed_date
    fill_in "Store chief designation", with: @project_stock.store_chief_designation
    fill_in "Store chief name", with: @project_stock.store_chief_name
    fill_in "Store chief sign date", with: @project_stock.store_chief_sign_date
    fill_in "User", with: @project_stock.user_id
    click_on "Create Project stock"

    assert_text "Project stock was successfully created"
    click_on "Back"
  end

  test "updating a Project stock" do
    visit project_stocks_url
    click_on "Edit", match: :first

    fill_in "Fiscal year", with: @project_stock.fiscal_year_id
    fill_in "Fy", with: @project_stock.fy
    fill_in "Office chief designation", with: @project_stock.office_chief_designation
    fill_in "Office chief name", with: @project_stock.office_chief_name
    fill_in "Office chief signed date", with: @project_stock.office_chief_signed_date
    fill_in "Office", with: @project_stock.office_id
    fill_in "Section chief designation", with: @project_stock.section_chief_designation
    fill_in "Section chief name", with: @project_stock.section_chief_name
    fill_in "Section chief signed date", with: @project_stock.section_chief_signed_date
    fill_in "Store chief designation", with: @project_stock.store_chief_designation
    fill_in "Store chief name", with: @project_stock.store_chief_name
    fill_in "Store chief sign date", with: @project_stock.store_chief_sign_date
    fill_in "User", with: @project_stock.user_id
    click_on "Update Project stock"

    assert_text "Project stock was successfully updated"
    click_on "Back"
  end

  test "destroying a Project stock" do
    visit project_stocks_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Project stock was successfully destroyed"
  end
end
