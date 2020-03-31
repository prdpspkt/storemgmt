require "application_system_test_case"

class Office::ItemEvaluationCommitteesTest < ApplicationSystemTestCase
  setup do
    @office_item_evaluation_committee = office_item_evaluation_committees(:one)
  end

  test "visiting the index" do
    visit office_item_evaluation_committees_url
    assert_selector "h1", text: "Office/Item Evaluation Committees"
  end

  test "creating a Item evaluation committee" do
    visit office_item_evaluation_committees_url
    click_on "New Office/Item Evaluation Committee"

    fill_in "Fiscal year", with: @office_item_evaluation_committee.fiscal_year_id
    fill_in "Name", with: @office_item_evaluation_committee.name
    fill_in "Office", with: @office_item_evaluation_committee.office_id
    fill_in "User", with: @office_item_evaluation_committee.user_id
    click_on "Create Item evaluation committee"

    assert_text "Item evaluation committee was successfully created"
    click_on "Back"
  end

  test "updating a Item evaluation committee" do
    visit office_item_evaluation_committees_url
    click_on "Edit", match: :first

    fill_in "Fiscal year", with: @office_item_evaluation_committee.fiscal_year_id
    fill_in "Name", with: @office_item_evaluation_committee.name
    fill_in "Office", with: @office_item_evaluation_committee.office_id
    fill_in "User", with: @office_item_evaluation_committee.user_id
    click_on "Update Item evaluation committee"

    assert_text "Item evaluation committee was successfully updated"
    click_on "Back"
  end

  test "destroying a Item evaluation committee" do
    visit office_item_evaluation_committees_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Item evaluation committee was successfully destroyed"
  end
end
