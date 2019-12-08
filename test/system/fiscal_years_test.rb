require "application_system_test_case"

class FiscalYearsTest < ApplicationSystemTestCase
  setup do
    @fiscal_year = fiscal_years(:one)
  end

  test "visiting the index" do
    visit fiscal_years_url
    assert_selector "h1", text: "Fiscal Years"
  end

  test "creating a Fiscal year" do
    visit fiscal_years_url
    click_on "New Fiscal Year"

    fill_in "Fy", with: @fiscal_year.fy
    fill_in "Office", with: @fiscal_year.office_id
    fill_in "User", with: @fiscal_year.user_id
    click_on "Create Fiscal year"

    assert_text "Fiscal year was successfully created"
    click_on "Back"
  end

  test "updating a Fiscal year" do
    visit fiscal_years_url
    click_on "Edit", match: :first

    fill_in "Fy", with: @fiscal_year.fy
    fill_in "Office", with: @fiscal_year.office_id
    fill_in "User", with: @fiscal_year.user_id
    click_on "Update Fiscal year"

    assert_text "Fiscal year was successfully updated"
    click_on "Back"
  end

  test "destroying a Fiscal year" do
    visit fiscal_years_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Fiscal year was successfully destroyed"
  end
end
