require "application_system_test_case"

class ProjectReleaseItemsTest < ApplicationSystemTestCase
  setup do
    @project_release_item = project_release_items(:one)
  end

  test "visiting the index" do
    visit project_release_items_url
    assert_selector "h1", text: "Project Release Items"
  end

  test "creating a Project release item" do
    visit project_release_items_url
    click_on "New Project Release Item"

    fill_in "Amount", with: @project_release_item.amount
    fill_in "Code no", with: @project_release_item.code_no
    fill_in "Fiscal year", with: @project_release_item.fiscal_year_id
    fill_in "Item register page no", with: @project_release_item.item_register_page_no
    fill_in "Name of item", with: @project_release_item.name_of_item
    fill_in "Office", with: @project_release_item.office_id
    fill_in "Office release", with: @project_release_item.office_release_id
    fill_in "Project", with: @project_release_item.project_id
    fill_in "Project item", with: @project_release_item.project_item_id
    fill_in "Quantity", with: @project_release_item.quantity
    fill_in "Rate", with: @project_release_item.rate
    fill_in "Remarks", with: @project_release_item.remarks
    fill_in "Specification", with: @project_release_item.specification
    fill_in "Unit", with: @project_release_item.unit
    fill_in "User", with: @project_release_item.user_id
    click_on "Create Project release item"

    assert_text "Project release item was successfully created"
    click_on "Back"
  end

  test "updating a Project release item" do
    visit project_release_items_url
    click_on "Edit", match: :first

    fill_in "Amount", with: @project_release_item.amount
    fill_in "Code no", with: @project_release_item.code_no
    fill_in "Fiscal year", with: @project_release_item.fiscal_year_id
    fill_in "Item register page no", with: @project_release_item.item_register_page_no
    fill_in "Name of item", with: @project_release_item.name_of_item
    fill_in "Office", with: @project_release_item.office_id
    fill_in "Office release", with: @project_release_item.office_release_id
    fill_in "Project", with: @project_release_item.project_id
    fill_in "Project item", with: @project_release_item.project_item_id
    fill_in "Quantity", with: @project_release_item.quantity
    fill_in "Rate", with: @project_release_item.rate
    fill_in "Remarks", with: @project_release_item.remarks
    fill_in "Specification", with: @project_release_item.specification
    fill_in "Unit", with: @project_release_item.unit
    fill_in "User", with: @project_release_item.user_id
    click_on "Update Project release item"

    assert_text "Project release item was successfully updated"
    click_on "Back"
  end

  test "destroying a Project release item" do
    visit project_release_items_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Project release item was successfully destroyed"
  end
end
