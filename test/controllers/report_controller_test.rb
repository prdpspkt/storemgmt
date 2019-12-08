require 'test_helper'

class ReportControllerTest < ActionDispatch::IntegrationTest
  test "should get office_demand_form" do
    get report_office_demand_form_url
    assert_response :success
  end

end
