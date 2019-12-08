require "application_system_test_case"

class LandAndStructureRecordBookItemsTest < ApplicationSystemTestCase
  setup do
    @land_and_structure_record_book_item = land_and_structure_record_book_items(:one)
  end

  test "visiting the index" do
    visit land_and_structure_record_book_items_url
    assert_selector "h1", text: "Land And Structure Record Book Items"
  end

  test "creating a Land and structure record book item" do
    visit land_and_structure_record_book_items_url
    click_on "New Land And Structure Record Book Item"

    fill_in "Area", with: @land_and_structure_record_book_item.area
    fill_in "Certificate no", with: @land_and_structure_record_book_item.certificate_no
    fill_in "Decision date", with: @land_and_structure_record_book_item.decision_date
    fill_in "District", with: @land_and_structure_record_book_item.district
    fill_in "Evaluated date", with: @land_and_structure_record_book_item.evaluated_date
    fill_in "Evaluated price", with: @land_and_structure_record_book_item.evaluated_price
    fill_in "Fiscal year", with: @land_and_structure_record_book_item.fiscal_year_id
    fill_in "Fy", with: @land_and_structure_record_book_item.fy
    fill_in "Land and structure record book", with: @land_and_structure_record_book_item.land_and_structure_record_book_id
    fill_in "Land and structure total cost", with: @land_and_structure_record_book_item.land_and_structure_total_cost
    fill_in "Local level", with: @land_and_structure_record_book_item.local_level
    fill_in "Map sheet no", with: @land_and_structure_record_book_item.map_sheet_no
    fill_in "Office", with: @land_and_structure_record_book_item.office_id
    fill_in "Owner name", with: @land_and_structure_record_book_item.owner_name
    fill_in "Plot no", with: @land_and_structure_record_book_item.plot_no
    fill_in "Price", with: @land_and_structure_record_book_item.price
    fill_in "Received date", with: @land_and_structure_record_book_item.received_date
    fill_in "Remarks", with: @land_and_structure_record_book_item.remarks
    fill_in "Structure cost", with: @land_and_structure_record_book_item.structure_cost
    fill_in "Structure covered area", with: @land_and_structure_record_book_item.structure_covered_area
    fill_in "Structure laying land area", with: @land_and_structure_record_book_item.structure_laying_land_area
    fill_in "Structure type", with: @land_and_structure_record_book_item.structure_type
    fill_in "Type", with: @land_and_structure_record_book_item.type
    fill_in "User", with: @land_and_structure_record_book_item.user_id
    fill_in "Ward no", with: @land_and_structure_record_book_item.ward_no
    click_on "Create Land and structure record book item"

    assert_text "Land and structure record book item was successfully created"
    click_on "Back"
  end

  test "updating a Land and structure record book item" do
    visit land_and_structure_record_book_items_url
    click_on "Edit", match: :first

    fill_in "Area", with: @land_and_structure_record_book_item.area
    fill_in "Certificate no", with: @land_and_structure_record_book_item.certificate_no
    fill_in "Decision date", with: @land_and_structure_record_book_item.decision_date
    fill_in "District", with: @land_and_structure_record_book_item.district
    fill_in "Evaluated date", with: @land_and_structure_record_book_item.evaluated_date
    fill_in "Evaluated price", with: @land_and_structure_record_book_item.evaluated_price
    fill_in "Fiscal year", with: @land_and_structure_record_book_item.fiscal_year_id
    fill_in "Fy", with: @land_and_structure_record_book_item.fy
    fill_in "Land and structure record book", with: @land_and_structure_record_book_item.land_and_structure_record_book_id
    fill_in "Land and structure total cost", with: @land_and_structure_record_book_item.land_and_structure_total_cost
    fill_in "Local level", with: @land_and_structure_record_book_item.local_level
    fill_in "Map sheet no", with: @land_and_structure_record_book_item.map_sheet_no
    fill_in "Office", with: @land_and_structure_record_book_item.office_id
    fill_in "Owner name", with: @land_and_structure_record_book_item.owner_name
    fill_in "Plot no", with: @land_and_structure_record_book_item.plot_no
    fill_in "Price", with: @land_and_structure_record_book_item.price
    fill_in "Received date", with: @land_and_structure_record_book_item.received_date
    fill_in "Remarks", with: @land_and_structure_record_book_item.remarks
    fill_in "Structure cost", with: @land_and_structure_record_book_item.structure_cost
    fill_in "Structure covered area", with: @land_and_structure_record_book_item.structure_covered_area
    fill_in "Structure laying land area", with: @land_and_structure_record_book_item.structure_laying_land_area
    fill_in "Structure type", with: @land_and_structure_record_book_item.structure_type
    fill_in "Type", with: @land_and_structure_record_book_item.type
    fill_in "User", with: @land_and_structure_record_book_item.user_id
    fill_in "Ward no", with: @land_and_structure_record_book_item.ward_no
    click_on "Update Land and structure record book item"

    assert_text "Land and structure record book item was successfully updated"
    click_on "Back"
  end

  test "destroying a Land and structure record book item" do
    visit land_and_structure_record_book_items_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Land and structure record book item was successfully destroyed"
  end
end
