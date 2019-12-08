require "application_system_test_case"

class OfficesTest < ApplicationSystemTestCase
  setup do
    @office = offices(:one)
  end

  test "visiting the index" do
    visit offices_url
    assert_selector "h1", text: "Offices"
  end

  test "creating a Office" do
    visit offices_url
    click_on "New Office"

    fill_in "Address", with: @office.address
    fill_in "Department", with: @office.department
    fill_in "Email", with: @office.email
    fill_in "Fax", with: @office.fax
    fill_in "Gov", with: @office.gov
    fill_in "Ministry", with: @office.ministry
    fill_in "Office", with: @office.office
    fill_in "Office chief", with: @office.office_chief
    fill_in "Phone", with: @office.phone
    fill_in "Section chief", with: @office.section_chief
    fill_in "Store chief", with: @office.store_chief
    fill_in "User", with: @office.user_id
    click_on "Create Office"

    assert_text "Office was successfully created"
    click_on "Back"
  end

  test "updating a Office" do
    visit offices_url
    click_on "Edit", match: :first

    fill_in "Address", with: @office.address
    fill_in "Department", with: @office.department
    fill_in "Email", with: @office.email
    fill_in "Fax", with: @office.fax
    fill_in "Gov", with: @office.gov
    fill_in "Ministry", with: @office.ministry
    fill_in "Office", with: @office.office
    fill_in "Office chief", with: @office.office_chief
    fill_in "Phone", with: @office.phone
    fill_in "Section chief", with: @office.section_chief
    fill_in "Store chief", with: @office.store_chief
    fill_in "User", with: @office.user_id
    click_on "Update Office"

    assert_text "Office was successfully updated"
    click_on "Back"
  end

  test "destroying a Office" do
    visit offices_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Office was successfully destroyed"
  end
end
