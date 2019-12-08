require "application_system_test_case"

class OfficeReleasesTest < ApplicationSystemTestCase
  setup do
    @office_release = office_releases(:one)
  end

  test "visiting the index" do
    visit office_releases_url
    assert_selector "h1", text: "Office Releases"
  end

  test "creating a Office release" do
    visit office_releases_url
    click_on "New Office Release"

    fill_in "Fiscal year", with: @office_release.fiscal_year_id
    fill_in "Fy", with: @office_release.fy
    fill_in "Office cheif name", with: @office_release.office_cheif_name
    fill_in "Office cheif signed date", with: @office_release.office_cheif_signed_date
    fill_in "Office", with: @office_release.office_id
    fill_in "Release date", with: @office_release.release_date
    fill_in "Release no", with: @office_release.release_no
    fill_in "Store chief name", with: @office_release.store_chief_name
    fill_in "Store chief signed date", with: @office_release.store_chief_signed_date
    fill_in "User", with: @office_release.user_id
    click_on "Create Office release"

    assert_text "Office release was successfully created"
    click_on "Back"
  end

  test "updating a Office release" do
    visit office_releases_url
    click_on "Edit", match: :first

    fill_in "Fiscal year", with: @office_release.fiscal_year_id
    fill_in "Fy", with: @office_release.fy
    fill_in "Office cheif name", with: @office_release.office_cheif_name
    fill_in "Office cheif signed date", with: @office_release.office_cheif_signed_date
    fill_in "Office", with: @office_release.office_id
    fill_in "Release date", with: @office_release.release_date
    fill_in "Release no", with: @office_release.release_no
    fill_in "Store chief name", with: @office_release.store_chief_name
    fill_in "Store chief signed date", with: @office_release.store_chief_signed_date
    fill_in "User", with: @office_release.user_id
    click_on "Update Office release"

    assert_text "Office release was successfully updated"
    click_on "Back"
  end

  test "destroying a Office release" do
    visit office_releases_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Office release was successfully destroyed"
  end
end
