require "application_system_test_case"

class ProjectTenderBreakdownsTest < ApplicationSystemTestCase
  setup do
    @project_tender_breakdown = project_tender_breakdowns(:one)
  end

  test "visiting the index" do
    visit project_tender_breakdowns_url
    assert_selector "h1", text: "Project Tender Breakdowns"
  end

  test "creating a Project tender breakdown" do
    visit project_tender_breakdowns_url
    click_on "New Project Tender Breakdown"

    check "Marked as final" if @project_tender_breakdown.marked_as_final
    fill_in "Office", with: @project_tender_breakdown.office_id
    fill_in "Project", with: @project_tender_breakdown.project_id
    fill_in "Project name en", with: @project_tender_breakdown.project_name_en
    fill_in "Project name ne", with: @project_tender_breakdown.project_name_ne
    fill_in "Project tender", with: @project_tender_breakdown.project_tender_id
    fill_in "User", with: @project_tender_breakdown.user_id
    click_on "Create Project tender breakdown"

    assert_text "Project tender breakdown was successfully created"
    click_on "Back"
  end

  test "updating a Project tender breakdown" do
    visit project_tender_breakdowns_url
    click_on "Edit", match: :first

    check "Marked as final" if @project_tender_breakdown.marked_as_final
    fill_in "Office", with: @project_tender_breakdown.office_id
    fill_in "Project", with: @project_tender_breakdown.project_id
    fill_in "Project name en", with: @project_tender_breakdown.project_name_en
    fill_in "Project name ne", with: @project_tender_breakdown.project_name_ne
    fill_in "Project tender", with: @project_tender_breakdown.project_tender_id
    fill_in "User", with: @project_tender_breakdown.user_id
    click_on "Update Project tender breakdown"

    assert_text "Project tender breakdown was successfully updated"
    click_on "Back"
  end

  test "destroying a Project tender breakdown" do
    visit project_tender_breakdowns_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Project tender breakdown was successfully destroyed"
  end
end
