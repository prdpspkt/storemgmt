require 'test_helper'

class Office::ItemEvaluationCommitteesControllerTest < ActionDispatch::IntegrationTest
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
    assert_difference('Office::ItemEvaluationCommittee.count') do
      post office_item_evaluation_committees_url, params: { office_item_evaluation_committee: { fiscal_year_id: @office_item_evaluation_committee.fiscal_year_id, name: @office_item_evaluation_committee.name, office_id: @office_item_evaluation_committee.office_id, user_id: @office_item_evaluation_committee.user_id } }
    end

    assert_redirected_to office_item_evaluation_committee_url(Office::ItemEvaluationCommittee.last)
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
    patch office_item_evaluation_committee_url(@office_item_evaluation_committee), params: { office_item_evaluation_committee: { fiscal_year_id: @office_item_evaluation_committee.fiscal_year_id, name: @office_item_evaluation_committee.name, office_id: @office_item_evaluation_committee.office_id, user_id: @office_item_evaluation_committee.user_id } }
    assert_redirected_to office_item_evaluation_committee_url(@office_item_evaluation_committee)
  end

  test "should destroy office_item_evaluation_committee" do
    assert_difference('Office::ItemEvaluationCommittee.count', -1) do
      delete office_item_evaluation_committee_url(@office_item_evaluation_committee)
    end

    assert_redirected_to office_item_evaluation_committees_url
  end
end
