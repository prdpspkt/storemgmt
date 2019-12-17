require 'test_helper'

class PneirtsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pneirt = pneirts(:one)
  end

  test "should get index" do
    get pneirts_url
    assert_response :success
  end

  test "should get new" do
    get new_pneirt_url
    assert_response :success
  end

  test "should create pneirt" do
    assert_difference('Pneirt.count') do
      post pneirts_url, params: { pneirt: { amount: @pneirt.amount, approx_age: @pneirt.approx_age, breakdown_id: @pneirt.breakdown_id, country: @pneirt.country, entry_no: @pneirt.entry_no, fiscal_year_id: @pneirt.fiscal_year_id, item_id: @pneirt.item_id, item_identificaiton_no: @pneirt.item_identificaiton_no, model_no: @pneirt.model_no, office_id: @pneirt.office_id, project_handover_form_id: @pneirt.project_handover_form_id, project_item_id: @pneirt.project_item_id, project_purchase_entry_item_id: @pneirt.project_purchase_entry_item_id, quantity: @pneirt.quantity, rate: @pneirt.rate, remarks: @pneirt.remarks, size: @pneirt.size, sku: @pneirt.sku, source: @pneirt.source, transaction_date: @pneirt.transaction_date, transaction_type: @pneirt.transaction_type, user_id: @pneirt.user_id } }
    end

    assert_redirected_to pneirt_url(Pneirt.last)
  end

  test "should show pneirt" do
    get pneirt_url(@pneirt)
    assert_response :success
  end

  test "should get edit" do
    get edit_pneirt_url(@pneirt)
    assert_response :success
  end

  test "should update pneirt" do
    patch pneirt_url(@pneirt), params: { pneirt: { amount: @pneirt.amount, approx_age: @pneirt.approx_age, breakdown_id: @pneirt.breakdown_id, country: @pneirt.country, entry_no: @pneirt.entry_no, fiscal_year_id: @pneirt.fiscal_year_id, item_id: @pneirt.item_id, item_identificaiton_no: @pneirt.item_identificaiton_no, model_no: @pneirt.model_no, office_id: @pneirt.office_id, project_handover_form_id: @pneirt.project_handover_form_id, project_item_id: @pneirt.project_item_id, project_purchase_entry_item_id: @pneirt.project_purchase_entry_item_id, quantity: @pneirt.quantity, rate: @pneirt.rate, remarks: @pneirt.remarks, size: @pneirt.size, sku: @pneirt.sku, source: @pneirt.source, transaction_date: @pneirt.transaction_date, transaction_type: @pneirt.transaction_type, user_id: @pneirt.user_id } }
    assert_redirected_to pneirt_url(@pneirt)
  end

  test "should destroy pneirt" do
    assert_difference('Pneirt.count', -1) do
      delete pneirt_url(@pneirt)
    end

    assert_redirected_to pneirts_url
  end
end
