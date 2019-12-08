require 'test_helper'

class OfficeItemEvaluationCommitteesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @office_item_evaluation_committee = office_item_evaluation_committees(:one)
  end

  test "should get index" do
    get office_item_evaluation_committees_url
    assert_response :success
  end

  test "should get new" do
    get new_office_item_evaluation_committee_url
    assert_response :success
  end

  test "should create office_item_evaluation_committee" do
    assert_difference('OfficeItemEvaluationCommittee.count') do
      post office_item_evaluation_committees_url, params: { office_item_evaluation_committee: { designation: @office_item_evaluation_committee.designation, fiscal_year_id: @office_item_evaluation_committee.fiscal_year_id, name: @office_item_evaluation_committee.name, office_id: @office_item_evaluation_committee.office_id, office_item_evaluation_id: @office_item_evaluation_committee.office_item_evaluation_id, user_id: @office_item_evaluation_committee.user_id } }
    end

    assert_redirected_to office_item_evaluation_committee_url(OfficeItemEvaluationCommittee.last)
  end

  test "should show office_item_evaluation_committee" do
    get office_item_evaluation_committee_url(@office_item_evaluation_committee)
    assert_response :success
  end

  test "should get edit" do
    get edit_office_item_evaluation_committee_url(@office_item_evaluation_committee)
    assert_response :success
  end

  test "should update office_item_evaluation_committee" do
    patch office_item_evaluation_committee_url(@office_item_evaluation_committee), params: { office_item_evaluation_committee: { designation: @office_item_evaluation_committee.designation, fiscal_year_id: @office_item_evaluation_committee.fiscal_year_id, name: @office_item_evaluation_committee.name, office_id: @office_item_evaluation_committee.office_id, office_item_evaluation_id: @office_item_evaluation_committee.office_item_evaluation_id, user_id: @office_item_evaluation_committee.user_id } }
    assert_redirected_to office_item_evaluation_committee_url(@office_item_evaluation_committee)
  end

  test "should destroy office_item_evaluation_committee" do
    assert_difference('OfficeItemEvaluationCommittee.count', -1) do
      delete office_item_evaluation_committee_url(@office_item_evaluation_committee)
    end

    assert_redirected_to office_item_evaluation_committees_url
  end
end
