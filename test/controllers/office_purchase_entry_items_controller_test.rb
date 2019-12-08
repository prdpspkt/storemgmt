require 'test_helper'

class OfficePurchaseEntryItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @office_purchase_entry_item = office_purchase_entry_items(:one)
  end

  test "should get index" do
    get office_purchase_entry_items_url
    assert_response :success
  end

  test "should get new" do
    get new_office_purchase_entry_item_url
    assert_response :success
  end

  test "should create office_purchase_entry_item" do
    assert_difference('OfficePurchaseEntryItem.count') do
      post office_purchase_entry_items_url, params: { office_purchase_entry_item: { amount: @office_purchase_entry_item.amount, amount_without_vat: @office_purchase_entry_item.amount_without_vat, fiscal_year: @office_purchase_entry_item.fiscal_year, fy: @office_purchase_entry_item.fy, item_classification_no: @office_purchase_entry_item.item_classification_no, item_identification_no: @office_purchase_entry_item.item_identification_no, item_registration_page_no: @office_purchase_entry_item.item_registration_page_no, model_no: @office_purchase_entry_item.model_no, name_of_item: @office_purchase_entry_item.name_of_item, office_id: @office_purchase_entry_item.office_id, office_purchase_entry_id: @office_purchase_entry_item.office_purchase_entry_id, other_expense: @office_purchase_entry_item.other_expense, purchase_handover_no: @office_purchase_entry_item.purchase_handover_no, quantity: @office_purchase_entry_item.quantity, rate: @office_purchase_entry_item.rate, remarks: @office_purchase_entry_item.remarks, specification: @office_purchase_entry_item.specification, total_amount: @office_purchase_entry_item.total_amount, unit: @office_purchase_entry_item.unit, user_id: @office_purchase_entry_item.user_id, vat: @office_purchase_entry_item.vat } }
    end

    assert_redirected_to office_purchase_entry_item_url(OfficePurchaseEntryItem.last)
  end

  test "should show office_purchase_entry_item" do
    get office_purchase_entry_item_url(@office_purchase_entry_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_office_purchase_entry_item_url(@office_purchase_entry_item)
    assert_response :success
  end

  test "should update office_purchase_entry_item" do
    patch office_purchase_entry_item_url(@office_purchase_entry_item), params: { office_purchase_entry_item: { amount: @office_purchase_entry_item.amount, amount_without_vat: @office_purchase_entry_item.amount_without_vat, fiscal_year: @office_purchase_entry_item.fiscal_year, fy: @office_purchase_entry_item.fy, item_classification_no: @office_purchase_entry_item.item_classification_no, item_identification_no: @office_purchase_entry_item.item_identification_no, item_registration_page_no: @office_purchase_entry_item.item_registration_page_no, model_no: @office_purchase_entry_item.model_no, name_of_item: @office_purchase_entry_item.name_of_item, office_id: @office_purchase_entry_item.office_id, office_purchase_entry_id: @office_purchase_entry_item.office_purchase_entry_id, other_expense: @office_purchase_entry_item.other_expense, purchase_handover_no: @office_purchase_entry_item.purchase_handover_no, quantity: @office_purchase_entry_item.quantity, rate: @office_purchase_entry_item.rate, remarks: @office_purchase_entry_item.remarks, specification: @office_purchase_entry_item.specification, total_amount: @office_purchase_entry_item.total_amount, unit: @office_purchase_entry_item.unit, user_id: @office_purchase_entry_item.user_id, vat: @office_purchase_entry_item.vat } }
    assert_redirected_to office_purchase_entry_item_url(@office_purchase_entry_item)
  end

  test "should destroy office_purchase_entry_item" do
    assert_difference('OfficePurchaseEntryItem.count', -1) do
      delete office_purchase_entry_item_url(@office_purchase_entry_item)
    end

    assert_redirected_to office_purchase_entry_items_url
  end
end
