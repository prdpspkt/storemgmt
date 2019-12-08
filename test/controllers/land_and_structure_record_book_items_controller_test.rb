require 'test_helper'

class LandAndStructureRecordBookItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @land_and_structure_record_book_item = land_and_structure_record_book_items(:one)
  end

  test "should get index" do
    get land_and_structure_record_book_items_url
    assert_response :success
  end

  test "should get new" do
    get new_land_and_structure_record_book_item_url
    assert_response :success
  end

  test "should create land_and_structure_record_book_item" do
    assert_difference('LandAndStructureRecordBookItem.count') do
      post land_and_structure_record_book_items_url, params: { land_and_structure_record_book_item: { area: @land_and_structure_record_book_item.area, certificate_no: @land_and_structure_record_book_item.certificate_no, decision_date: @land_and_structure_record_book_item.decision_date, district: @land_and_structure_record_book_item.district, evaluated_date: @land_and_structure_record_book_item.evaluated_date, evaluated_price: @land_and_structure_record_book_item.evaluated_price, fiscal_year_id: @land_and_structure_record_book_item.fiscal_year_id, fy: @land_and_structure_record_book_item.fy, land_and_structure_record_book_id: @land_and_structure_record_book_item.land_and_structure_record_book_id, land_and_structure_total_cost: @land_and_structure_record_book_item.land_and_structure_total_cost, local_level: @land_and_structure_record_book_item.local_level, map_sheet_no: @land_and_structure_record_book_item.map_sheet_no, office_id: @land_and_structure_record_book_item.office_id, owner_name: @land_and_structure_record_book_item.owner_name, plot_no: @land_and_structure_record_book_item.plot_no, price: @land_and_structure_record_book_item.price, received_date: @land_and_structure_record_book_item.received_date, remarks: @land_and_structure_record_book_item.remarks, structure_cost: @land_and_structure_record_book_item.structure_cost, structure_covered_area: @land_and_structure_record_book_item.structure_covered_area, structure_laying_land_area: @land_and_structure_record_book_item.structure_laying_land_area, structure_type: @land_and_structure_record_book_item.structure_type, type: @land_and_structure_record_book_item.type, user_id: @land_and_structure_record_book_item.user_id, ward_no: @land_and_structure_record_book_item.ward_no } }
    end

    assert_redirected_to land_and_structure_record_book_item_url(LandAndStructureRecordBookItem.last)
  end

  test "should show land_and_structure_record_book_item" do
    get land_and_structure_record_book_item_url(@land_and_structure_record_book_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_land_and_structure_record_book_item_url(@land_and_structure_record_book_item)
    assert_response :success
  end

  test "should update land_and_structure_record_book_item" do
    patch land_and_structure_record_book_item_url(@land_and_structure_record_book_item), params: { land_and_structure_record_book_item: { area: @land_and_structure_record_book_item.area, certificate_no: @land_and_structure_record_book_item.certificate_no, decision_date: @land_and_structure_record_book_item.decision_date, district: @land_and_structure_record_book_item.district, evaluated_date: @land_and_structure_record_book_item.evaluated_date, evaluated_price: @land_and_structure_record_book_item.evaluated_price, fiscal_year_id: @land_and_structure_record_book_item.fiscal_year_id, fy: @land_and_structure_record_book_item.fy, land_and_structure_record_book_id: @land_and_structure_record_book_item.land_and_structure_record_book_id, land_and_structure_total_cost: @land_and_structure_record_book_item.land_and_structure_total_cost, local_level: @land_and_structure_record_book_item.local_level, map_sheet_no: @land_and_structure_record_book_item.map_sheet_no, office_id: @land_and_structure_record_book_item.office_id, owner_name: @land_and_structure_record_book_item.owner_name, plot_no: @land_and_structure_record_book_item.plot_no, price: @land_and_structure_record_book_item.price, received_date: @land_and_structure_record_book_item.received_date, remarks: @land_and_structure_record_book_item.remarks, structure_cost: @land_and_structure_record_book_item.structure_cost, structure_covered_area: @land_and_structure_record_book_item.structure_covered_area, structure_laying_land_area: @land_and_structure_record_book_item.structure_laying_land_area, structure_type: @land_and_structure_record_book_item.structure_type, type: @land_and_structure_record_book_item.type, user_id: @land_and_structure_record_book_item.user_id, ward_no: @land_and_structure_record_book_item.ward_no } }
    assert_redirected_to land_and_structure_record_book_item_url(@land_and_structure_record_book_item)
  end

  test "should destroy land_and_structure_record_book_item" do
    assert_difference('LandAndStructureRecordBookItem.count', -1) do
      delete land_and_structure_record_book_item_url(@land_and_structure_record_book_item)
    end

    assert_redirected_to land_and_structure_record_book_items_url
  end
end
