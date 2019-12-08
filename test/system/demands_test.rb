require "application_system_test_case"

class DemandsTest < ApplicationSystemTestCase
  setup do
    @demand = demands(:one)
  end

  test "visiting the index" do
    visit demands_url
    assert_selector "h1", text: "Demands"
  end

  test "creating a Demand" do
    visit demands_url
    click_on "New Demand"

    fill_in "Demand by", with: @demand.demand_by
    fill_in "Demand date", with: @demand.demand_date
    fill_in "Demand no", with: @demand.demand_no
    fill_in "Fiscal year", with: @demand.fiscal_year
    fill_in "Fy", with: @demand.fy
    fill_in "Needed to purchase", with: @demand.needed_to_purchase
    fill_in "Office", with: @demand.office_id
    fill_in "Ordered by", with: @demand.ordered_by
    fill_in "Ordered date", with: @demand.ordered_date
    fill_in "Recommended by", with: @demand.recommended_by
    fill_in "Recommended date", with: @demand.recommended_date
    fill_in "Recorded by", with: @demand.recorded_by
    fill_in "Recorded date", with: @demand.recorded_date
    fill_in "User", with: @demand.user_id
    click_on "Create Demand"

    assert_text "Demand was successfully created"
    click_on "Back"
  end

  test "updating a Demand" do
    visit demands_url
    click_on "Edit", match: :first

    fill_in "Demand by", with: @demand.demand_by
    fill_in "Demand date", with: @demand.demand_date
    fill_in "Demand no", with: @demand.demand_no
    fill_in "Fiscal year", with: @demand.fiscal_year
    fill_in "Fy", with: @demand.fy
    fill_in "Needed to purchase", with: @demand.needed_to_purchase
    fill_in "Office", with: @demand.office_id
    fill_in "Ordered by", with: @demand.ordered_by
    fill_in "Ordered date", with: @demand.ordered_date
    fill_in "Recommended by", with: @demand.recommended_by
    fill_in "Recommended date", with: @demand.recommended_date
    fill_in "Recorded by", with: @demand.recorded_by
    fill_in "Recorded date", with: @demand.recorded_date
    fill_in "User", with: @demand.user_id
    click_on "Update Demand"

    assert_text "Demand was successfully updated"
    click_on "Back"
  end

  test "destroying a Demand" do
    visit demands_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Demand was successfully destroyed"
  end
end
