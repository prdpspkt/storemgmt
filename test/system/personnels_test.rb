require "application_system_test_case"

class PersonnelsTest < ApplicationSystemTestCase
  setup do
    @personnel = personnels(:one)
  end

  test "visiting the index" do
    visit personnels_url
    assert_selector "h1", text: "Personnels"
  end

  test "creating a Personnel" do
    visit personnels_url
    click_on "New Personnel"

    fill_in "Address", with: @personnel.address
    fill_in "Ctroll", with: @personnel.ctroll
    fill_in "Group", with: @personnel.group
    fill_in "Level class", with: @personnel.level_class
    fill_in "Name", with: @personnel.name
    fill_in "Phone", with: @personnel.phone
    fill_in "Post", with: @personnel.post
    fill_in "Service", with: @personnel.service
    fill_in "Sub group", with: @personnel.sub_group
    click_on "Create Personnel"

    assert_text "Personnel was successfully created"
    click_on "Back"
  end

  test "updating a Personnel" do
    visit personnels_url
    click_on "Edit", match: :first

    fill_in "Address", with: @personnel.address
    fill_in "Ctroll", with: @personnel.ctroll
    fill_in "Group", with: @personnel.group
    fill_in "Level class", with: @personnel.level_class
    fill_in "Name", with: @personnel.name
    fill_in "Phone", with: @personnel.phone
    fill_in "Post", with: @personnel.post
    fill_in "Service", with: @personnel.service
    fill_in "Sub group", with: @personnel.sub_group
    click_on "Update Personnel"

    assert_text "Personnel was successfully updated"
    click_on "Back"
  end

  test "destroying a Personnel" do
    visit personnels_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Personnel was successfully destroyed"
  end
end
