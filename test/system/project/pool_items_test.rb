require "application_system_test_case"

class Project::PoolItemsTest < ApplicationSystemTestCase
  setup do
    @project_pool_item = project_pool_items(:one)
  end

  test "visiting the index" do
    visit project_pool_items_url
    assert_selector "h1", text: "Project/Pool Items"
  end

  test "creating a Pool item" do
    visit project_pool_items_url
    click_on "New Project/Pool Item"

    fill_in "Item category", with: @project_pool_item.item_category_id
    fill_in "Name of item en", with: @project_pool_item.name_of_item_en
    fill_in "Name of item ne", with: @project_pool_item.name_of_item_ne
    fill_in "Unit en", with: @project_pool_item.unit_en
    fill_in "Unit ne", with: @project_pool_item.unit_ne
    click_on "Create Pool item"

    assert_text "Pool item was successfully created"
    click_on "Back"
  end

  test "updating a Pool item" do
    visit project_pool_items_url
    click_on "Edit", match: :first

    fill_in "Item category", with: @project_pool_item.item_category_id
    fill_in "Name of item en", with: @project_pool_item.name_of_item_en
    fill_in "Name of item ne", with: @project_pool_item.name_of_item_ne
    fill_in "Unit en", with: @project_pool_item.unit_en
    fill_in "Unit ne", with: @project_pool_item.unit_ne
    click_on "Update Pool item"

    assert_text "Pool item was successfully updated"
    click_on "Back"
  end

  test "destroying a Pool item" do
    visit project_pool_items_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Pool item was successfully destroyed"
  end
end
