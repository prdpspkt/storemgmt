require 'test_helper'

class MarkAsFinalControllerTest < ActionDispatch::IntegrationTest
  test "should get demand_form" do
    get mark_as_final_demand_form_url
    assert_response :success
  end

  test "should get purchase_order" do
    get mark_as_final_purchase_order_url
    assert_response :success
  end

end
