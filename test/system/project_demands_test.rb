require "application_system_test_case"

class ProjectDemandsTest < ApplicationSystemTestCase
  setup do
    @project_demand = project_demands(:one)
  end

  test "visiting the index" do
    visit project_demands_url
    assert_selector "h1", text: "Project Demands"
  end

  test "creating a Project demand" do
    visit project_demands_url
    click_on "New Project Demand"

    fill_in "Demand by", with: @project_demand.demand_by
    fill_in "Demand date", with: @project_demand.demand_date
    fill_in "Demand no", with: @project_demand.demand_no
    fill_in "Fiscal year", with: @project_demand.fiscal_year_id
    fill_in "Item", with: @project_demand.item_id
    check "Marked as final" if @project_demand.marked_as_final
    check "Needed to purchase" if @project_demand.needed_to_purchase
    fill_in "Office", with: @project_demand.office_id
    fill_in "Ordered by", with: @project_demand.ordered_by
    fill_in "Ordered date", with: @project_demand.ordered_date
    fill_in "Project", with: @project_demand.project_id
    fill_in "Recommended by", with: @project_demand.recommended_by
    fill_in "Recorded by", with: @project_demand.recorded_by
    fill_in "Recorded date", with: @project_demand.recorded_date
    fill_in "User", with: @project_demand.user_id
    click_on "Create Project demand"

    assert_text "Project demand was successfully created"
    click_on "Back"
  end

  test "updating a Project demand" do
    visit project_demands_url
    click_on "Edit", match: :first

    fill_in "Demand by", with: @project_demand.demand_by
    fill_in "Demand date", with: @project_demand.demand_date
    fill_in "Demand no", with: @project_demand.demand_no
    fill_in "Fiscal year", with: @project_demand.fiscal_year_id
    fill_in "Item", with: @project_demand.item_id
    check "Marked as final" if @project_demand.marked_as_final
    check "Needed to purchase" if @project_demand.needed_to_purchase
    fill_in "Office", with: @project_demand.office_id
    fill_in "Ordered by", with: @project_demand.ordered_by
    fill_in "Ordered date", with: @project_demand.ordered_date
    fill_in "Project", with: @project_demand.project_id
    fill_in "Recommended by", with: @project_demand.recommended_by
    fill_in "Recorded by", with: @project_demand.recorded_by
    fill_in "Recorded date", with: @project_demand.recorded_date
    fill_in "User", with: @project_demand.user_id
    click_on "Update Project demand"

    assert_text "Project demand was successfully updated"
    click_on "Back"
  end

  test "destroying a Project demand" do
    visit project_demands_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Project demand was successfully destroyed"
  end
end
