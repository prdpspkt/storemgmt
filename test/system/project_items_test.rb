require "application_system_test_case"

class ProjectItemsTest < ApplicationSystemTestCase
  setup do
    @project_item = project_items(:one)
  end

  test "visiting the index" do
    visit project_items_url
    assert_selector "h1", text: "Project Items"
  end

  test "creating a Project item" do
    visit project_items_url
    click_on "New Project Item"

    fill_in "Fy", with: @project_item.fy_id
    fill_in "Item", with: @project_item.item_id
    fill_in "Item register page no", with: @project_item.item_register_page_no
    fill_in "Name of item en", with: @project_item.name_of_item_en
    fill_in "Name of item ne", with: @project_item.name_of_item_ne
    fill_in "Not working", with: @project_item.not_working
    fill_in "Office", with: @project_item.office_id
    fill_in "Project", with: @project_item.project_id
    fill_in "To be auctioned", with: @project_item.to_be_auctioned
    fill_in "To be conserved", with: @project_item.to_be_conserved
    fill_in "To be repaired", with: @project_item.to_be_repaired
    fill_in "Type", with: @project_item.type
    fill_in "Unit en", with: @project_item.unit_en
    fill_in "Unit ne", with: @project_item.unit_ne
    fill_in "User", with: @project_item.user_id
    fill_in "Working", with: @project_item.working
    click_on "Create Project item"

    assert_text "Project item was successfully created"
    click_on "Back"
  end

  test "updating a Project item" do
    visit project_items_url
    click_on "Edit", match: :first

    fill_in "Fy", with: @project_item.fy_id
    fill_in "Item", with: @project_item.item_id
    fill_in "Item register page no", with: @project_item.item_register_page_no
    fill_in "Name of item en", with: @project_item.name_of_item_en
    fill_in "Name of item ne", with: @project_item.name_of_item_ne
    fill_in "Not working", with: @project_item.not_working
    fill_in "Office", with: @project_item.office_id
    fill_in "Project", with: @project_item.project_id
    fill_in "To be auctioned", with: @project_item.to_be_auctioned
    fill_in "To be conserved", with: @project_item.to_be_conserved
    fill_in "To be repaired", with: @project_item.to_be_repaired
    fill_in "Type", with: @project_item.type
    fill_in "Unit en", with: @project_item.unit_en
    fill_in "Unit ne", with: @project_item.unit_ne
    fill_in "User", with: @project_item.user_id
    fill_in "Working", with: @project_item.working
    click_on "Update Project item"

    assert_text "Project item was successfully updated"
    click_on "Back"
  end

  test "destroying a Project item" do
    visit project_items_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Project item was successfully destroyed"
  end
end
