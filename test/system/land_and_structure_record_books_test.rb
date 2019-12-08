require "application_system_test_case"

class LandAndStructureRecordBooksTest < ApplicationSystemTestCase
  setup do
    @land_and_structure_record_book = land_and_structure_record_books(:one)
  end

  test "visiting the index" do
    visit land_and_structure_record_books_url
    assert_selector "h1", text: "Land And Structure Record Books"
  end

  test "creating a Land and structure record book" do
    visit land_and_structure_record_books_url
    click_on "New Land And Structure Record Book"

    fill_in "Fiscal year", with: @land_and_structure_record_book.fiscal_year_id
    fill_in "Fy", with: @land_and_structure_record_book.fy
    fill_in "Office chief designation", with: @land_and_structure_record_book.office_chief_designation
    fill_in "Office chief name", with: @land_and_structure_record_book.office_chief_name
    fill_in "Office chief signed date", with: @land_and_structure_record_book.office_chief_signed_date
    fill_in "Office", with: @land_and_structure_record_book.office_id
    fill_in "Store chief designation", with: @land_and_structure_record_book.store_chief_designation
    fill_in "Store chief name", with: @land_and_structure_record_book.store_chief_name
    fill_in "Store chief signed date", with: @land_and_structure_record_book.store_chief_signed_date
    fill_in "User", with: @land_and_structure_record_book.user_id
    click_on "Create Land and structure record book"

    assert_text "Land and structure record book was successfully created"
    click_on "Back"
  end

  test "updating a Land and structure record book" do
    visit land_and_structure_record_books_url
    click_on "Edit", match: :first

    fill_in "Fiscal year", with: @land_and_structure_record_book.fiscal_year_id
    fill_in "Fy", with: @land_and_structure_record_book.fy
    fill_in "Office chief designation", with: @land_and_structure_record_book.office_chief_designation
    fill_in "Office chief name", with: @land_and_structure_record_book.office_chief_name
    fill_in "Office chief signed date", with: @land_and_structure_record_book.office_chief_signed_date
    fill_in "Office", with: @land_and_structure_record_book.office_id
    fill_in "Store chief designation", with: @land_and_structure_record_book.store_chief_designation
    fill_in "Store chief name", with: @land_and_structure_record_book.store_chief_name
    fill_in "Store chief signed date", with: @land_and_structure_record_book.store_chief_signed_date
    fill_in "User", with: @land_and_structure_record_book.user_id
    click_on "Update Land and structure record book"

    assert_text "Land and structure record book was successfully updated"
    click_on "Back"
  end

  test "destroying a Land and structure record book" do
    visit land_and_structure_record_books_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Land and structure record book was successfully destroyed"
  end
end
