require "application_system_test_case"

class OfficeStocksTest < ApplicationSystemTestCase
  setup do
    @office_stock = office_stocks(:one)
  end

  test "visiting the index" do
    visit office_stocks_url
    assert_selector "h1", text: "Office Stocks"
  end

  test "creating a Office stock" do
    visit office_stocks_url
    click_on "New Office Stock"

    fill_in "Fiscal year", with: @office_stock.fiscal_year_id
    fill_in "Fy", with: @office_stock.fy
    fill_in "Office chief designation", with: @office_stock.office_chief_designation
    fill_in "Office chief name", with: @office_stock.office_chief_name
    fill_in "Office chief signed date", with: @office_stock.office_chief_signed_date
    fill_in "Office", with: @office_stock.office_id
    fill_in "Section chief designation", with: @office_stock.section_chief_designation
    fill_in "Section chief name", with: @office_stock.section_chief_name
    fill_in "Section chief signed date", with: @office_stock.section_chief_signed_date
    fill_in "Store chief designation", with: @office_stock.store_chief_designation
    fill_in "Store chief name", with: @office_stock.store_chief_name
    fill_in "Store chief sign date", with: @office_stock.store_chief_sign_date
    fill_in "User", with: @office_stock.user_id
    click_on "Create Office stock"

    assert_text "Office stock was successfully created"
    click_on "Back"
  end

  test "updating a Office stock" do
    visit office_stocks_url
    click_on "Edit", match: :first

    fill_in "Fiscal year", with: @office_stock.fiscal_year_id
    fill_in "Fy", with: @office_stock.fy
    fill_in "Office chief designation", with: @office_stock.office_chief_designation
    fill_in "Office chief name", with: @office_stock.office_chief_name
    fill_in "Office chief signed date", with: @office_stock.office_chief_signed_date
    fill_in "Office", with: @office_stock.office_id
    fill_in "Section chief designation", with: @office_stock.section_chief_designation
    fill_in "Section chief name", with: @office_stock.section_chief_name
    fill_in "Section chief signed date", with: @office_stock.section_chief_signed_date
    fill_in "Store chief designation", with: @office_stock.store_chief_designation
    fill_in "Store chief name", with: @office_stock.store_chief_name
    fill_in "Store chief sign date", with: @office_stock.store_chief_sign_date
    fill_in "User", with: @office_stock.user_id
    click_on "Update Office stock"

    assert_text "Office stock was successfully updated"
    click_on "Back"
  end

  test "destroying a Office stock" do
    visit office_stocks_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Office stock was successfully destroyed"
  end
end
