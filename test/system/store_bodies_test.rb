require "application_system_test_case"

class StoreBodiesTest < ApplicationSystemTestCase
  setup do
    @store_body = store_bodies(:one)
  end

  test "visiting the index" do
    visit store_bodies_url
    assert_selector "h1", text: "Store Bodies"
  end

  test "creating a Store body" do
    visit store_bodies_url
    click_on "New Store Body"

    fill_in "Fiscal year", with: @store_body.fiscal_year_id
    fill_in "Office chief", with: @store_body.office_chief
    fill_in "Office chief degination", with: @store_body.office_chief_degination
    fill_in "Office", with: @store_body.office_id
    fill_in "Section chief", with: @store_body.section_chief
    fill_in "Section chief degination", with: @store_body.section_chief_degination
    check "Status" if @store_body.status
    fill_in "Store keeper designation", with: @store_body.store_keeper_designation
    fill_in "Store keeper name", with: @store_body.store_keeper_name
    click_on "Create Store body"

    assert_text "Store body was successfully created"
    click_on "Back"
  end

  test "updating a Store body" do
    visit store_bodies_url
    click_on "Edit", match: :first

    fill_in "Fiscal year", with: @store_body.fiscal_year_id
    fill_in "Office chief", with: @store_body.office_chief
    fill_in "Office chief degination", with: @store_body.office_chief_degination
    fill_in "Office", with: @store_body.office_id
    fill_in "Section chief", with: @store_body.section_chief
    fill_in "Section chief degination", with: @store_body.section_chief_degination
    check "Status" if @store_body.status
    fill_in "Store keeper designation", with: @store_body.store_keeper_designation
    fill_in "Store keeper name", with: @store_body.store_keeper_name
    click_on "Update Store body"

    assert_text "Store body was successfully updated"
    click_on "Back"
  end

  test "destroying a Store body" do
    visit store_bodies_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Store body was successfully destroyed"
  end
end
