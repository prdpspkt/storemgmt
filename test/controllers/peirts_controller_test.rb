require 'test_helper'

class PeirtsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @peirt = peirts(:one)
  end

  test "should get index" do
    get peirts_url
    assert_response :success
  end

  test "should get new" do
    get new_peirt_url
    assert_response :success
  end

  test "should create peirt" do
    assert_difference('Peirt.count') do
      post peirts_url, params: { peirt: { amount: @peirt.amount, entry_no: @peirt.entry_no, fiscal_year_id: @peirt.fiscal_year_id, item_id: @peirt.item_id, office_id: @peirt.office_id, office_purchase_entry_item_id: @peirt.office_purchase_entry_item_id, project_id: @peirt.project_id, project_item_id: @peirt.project_item_id, project_release_item_id: @peirt.project_release_item_id, quantity: @peirt.quantity, rate: @peirt.rate, remarks: @peirt.remarks, sku: @peirt.sku, transaction_date: @peirt.transaction_date, transaction_type: @peirt.transaction_type, user_id: @peirt.user_id } }
    end

    assert_redirected_to peirt_url(Peirt.last)
  end

  test "should show peirt" do
    get peirt_url(@peirt)
    assert_response :success
  end

  test "should get edit" do
    get edit_peirt_url(@peirt)
    assert_response :success
  end

  test "should update peirt" do
    patch peirt_url(@peirt), params: { peirt: { amount: @peirt.amount, entry_no: @peirt.entry_no, fiscal_year_id: @peirt.fiscal_year_id, item_id: @peirt.item_id, office_id: @peirt.office_id, office_purchase_entry_item_id: @peirt.office_purchase_entry_item_id, project_id: @peirt.project_id, project_item_id: @peirt.project_item_id, project_release_item_id: @peirt.project_release_item_id, quantity: @peirt.quantity, rate: @peirt.rate, remarks: @peirt.remarks, sku: @peirt.sku, transaction_date: @peirt.transaction_date, transaction_type: @peirt.transaction_type, user_id: @peirt.user_id } }
    assert_redirected_to peirt_url(@peirt)
  end

  test "should destroy peirt" do
    assert_difference('Peirt.count', -1) do
      delete peirt_url(@peirt)
    end

    assert_redirected_to peirts_url
  end
end
