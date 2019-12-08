require 'test_helper'

class LandAndStructureRecordBooksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @land_and_structure_record_book = land_and_structure_record_books(:one)
  end

  test "should get index" do
    get land_and_structure_record_books_url
    assert_response :success
  end

  test "should get new" do
    get new_land_and_structure_record_book_url
    assert_response :success
  end

  test "should create land_and_structure_record_book" do
    assert_difference('LandAndStructureRecordBook.count') do
      post land_and_structure_record_books_url, params: { land_and_structure_record_book: { fiscal_year_id: @land_and_structure_record_book.fiscal_year_id, fy: @land_and_structure_record_book.fy, office_chief_designation: @land_and_structure_record_book.office_chief_designation, office_chief_name: @land_and_structure_record_book.office_chief_name, office_chief_signed_date: @land_and_structure_record_book.office_chief_signed_date, office_id: @land_and_structure_record_book.office_id, store_chief_designation: @land_and_structure_record_book.store_chief_designation, store_chief_name: @land_and_structure_record_book.store_chief_name, store_chief_signed_date: @land_and_structure_record_book.store_chief_signed_date, user_id: @land_and_structure_record_book.user_id } }
    end

    assert_redirected_to land_and_structure_record_book_url(LandAndStructureRecordBook.last)
  end

  test "should show land_and_structure_record_book" do
    get land_and_structure_record_book_url(@land_and_structure_record_book)
    assert_response :success
  end

  test "should get edit" do
    get edit_land_and_structure_record_book_url(@land_and_structure_record_book)
    assert_response :success
  end

  test "should update land_and_structure_record_book" do
    patch land_and_structure_record_book_url(@land_and_structure_record_book), params: { land_and_structure_record_book: { fiscal_year_id: @land_and_structure_record_book.fiscal_year_id, fy: @land_and_structure_record_book.fy, office_chief_designation: @land_and_structure_record_book.office_chief_designation, office_chief_name: @land_and_structure_record_book.office_chief_name, office_chief_signed_date: @land_and_structure_record_book.office_chief_signed_date, office_id: @land_and_structure_record_book.office_id, store_chief_designation: @land_and_structure_record_book.store_chief_designation, store_chief_name: @land_and_structure_record_book.store_chief_name, store_chief_signed_date: @land_and_structure_record_book.store_chief_signed_date, user_id: @land_and_structure_record_book.user_id } }
    assert_redirected_to land_and_structure_record_book_url(@land_and_structure_record_book)
  end

  test "should destroy land_and_structure_record_book" do
    assert_difference('LandAndStructureRecordBook.count', -1) do
      delete land_and_structure_record_book_url(@land_and_structure_record_book)
    end

    assert_redirected_to land_and_structure_record_books_url
  end
end
