require "application_system_test_case"

class ItemDisposalsTest < ApplicationSystemTestCase
  setup do
    @item_disposal = item_disposals(:one)
  end

  test "visiting the index" do
    visit item_disposals_url
    assert_selector "h1", text: "Item Disposals"
  end

  test "creating a Item disposal" do
    visit item_disposals_url
    click_on "New Item Disposal"

    fill_in "Decision date", with: @item_disposal.decision_date
    fill_in "Decision made by", with: @item_disposal.decision_made_by
    fill_in "Fiscal year", with: @item_disposal.fiscal_year_id
    fill_in "Fy", with: @item_disposal.fy
    fill_in "Office chief designation", with: @item_disposal.office_chief_designation
    fill_in "Office chief name", with: @item_disposal.office_chief_name
    fill_in "Office chief signed date", with: @item_disposal.office_chief_signed_date
    fill_in "Office", with: @item_disposal.office_id
    fill_in "Section chief designation", with: @item_disposal.section_chief_designation
    fill_in "Section chief name", with: @item_disposal.section_chief_name
    fill_in "Section chief signed date", with: @item_disposal.section_chief_signed_date
    fill_in "Store chief designation", with: @item_disposal.store_chief_designation
    fill_in "Store chief name", with: @item_disposal.store_chief_name
    fill_in "Store chief signed date", with: @item_disposal.store_chief_signed_date
    fill_in "User", with: @item_disposal.user_id
    click_on "Create Item disposal"

    assert_text "Item disposal was successfully created"
    click_on "Back"
  end

  test "updating a Item disposal" do
    visit item_disposals_url
    click_on "Edit", match: :first

    fill_in "Decision date", with: @item_disposal.decision_date
    fill_in "Decision made by", with: @item_disposal.decision_made_by
    fill_in "Fiscal year", with: @item_disposal.fiscal_year_id
    fill_in "Fy", with: @item_disposal.fy
    fill_in "Office chief designation", with: @item_disposal.office_chief_designation
    fill_in "Office chief name", with: @item_disposal.office_chief_name
    fill_in "Office chief signed date", with: @item_disposal.office_chief_signed_date
    fill_in "Office", with: @item_disposal.office_id
    fill_in "Section chief designation", with: @item_disposal.section_chief_designation
    fill_in "Section chief name", with: @item_disposal.section_chief_name
    fill_in "Section chief signed date", with: @item_disposal.section_chief_signed_date
    fill_in "Store chief designation", with: @item_disposal.store_chief_designation
    fill_in "Store chief name", with: @item_disposal.store_chief_name
    fill_in "Store chief signed date", with: @item_disposal.store_chief_signed_date
    fill_in "User", with: @item_disposal.user_id
    click_on "Update Item disposal"

    assert_text "Item disposal was successfully updated"
    click_on "Back"
  end

  test "destroying a Item disposal" do
    visit item_disposals_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Item disposal was successfully destroyed"
  end
end
