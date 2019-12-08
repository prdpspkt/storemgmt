require "application_system_test_case"

class ProjectEntryItemsTest < ApplicationSystemTestCase
  setup do
    @project_entry_item = project_entry_items(:one)
  end

  test "visiting the index" do
    visit project_entry_items_url
    assert_selector "h1", text: "Project Entry Items"
  end

  test "creating a Project entry item" do
    visit project_entry_items_url
    click_on "New Project Entry Item"

    fill_in "Fy", with: @project_entry_item.fy_id
    fill_in "Item", with: @project_entry_item.item_id
    fill_in "Item register page no", with: @project_entry_item.item_register_page_no
    fill_in "Name of item en", with: @project_entry_item.name_of_item_en
    fill_in "Name of item ne", with: @project_entry_item.name_of_item_ne
    fill_in "Office", with: @project_entry_item.office_id
    fill_in "Type", with: @project_entry_item.type
    fill_in "Unit en", with: @project_entry_item.unit_en
    fill_in "Unit ne", with: @project_entry_item.unit_ne
    fill_in "User", with: @project_entry_item.user_id
    click_on "Create Project entry item"

    assert_text "Project entry item was successfully created"
    click_on "Back"
  end

  test "updating a Project entry item" do
    visit project_entry_items_url
    click_on "Edit", match: :first

    fill_in "Fy", with: @project_entry_item.fy_id
    fill_in "Item", with: @project_entry_item.item_id
    fill_in "Item register page no", with: @project_entry_item.item_register_page_no
    fill_in "Name of item en", with: @project_entry_item.name_of_item_en
    fill_in "Name of item ne", with: @project_entry_item.name_of_item_ne
    fill_in "Office", with: @project_entry_item.office_id
    fill_in "Type", with: @project_entry_item.type
    fill_in "Unit en", with: @project_entry_item.unit_en
    fill_in "Unit ne", with: @project_entry_item.unit_ne
    fill_in "User", with: @project_entry_item.user_id
    click_on "Update Project entry item"

    assert_text "Project entry item was successfully updated"
    click_on "Back"
  end

  test "destroying a Project entry item" do
    visit project_entry_items_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Project entry item was successfully destroyed"
  end
end
