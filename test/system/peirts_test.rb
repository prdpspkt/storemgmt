require "application_system_test_case"

class PeirtsTest < ApplicationSystemTestCase
  setup do
    @peirt = peirts(:one)
  end

  test "visiting the index" do
    visit peirts_url
    assert_selector "h1", text: "Peirts"
  end

  test "creating a Peirt" do
    visit peirts_url
    click_on "New Peirt"

    fill_in "Amount", with: @peirt.amount
    fill_in "Entry no", with: @peirt.entry_no
    fill_in "Fiscal year", with: @peirt.fiscal_year_id
    fill_in "Item", with: @peirt.item_id
    fill_in "Office", with: @peirt.office_id
    fill_in "Office purchase entry item", with: @peirt.office_purchase_entry_item_id
    fill_in "Project", with: @peirt.project_id
    fill_in "Project item", with: @peirt.project_item_id
    fill_in "Project release item", with: @peirt.project_release_item_id
    fill_in "Quantity", with: @peirt.quantity
    fill_in "Rate", with: @peirt.rate
    fill_in "Remarks", with: @peirt.remarks
    fill_in "Sku", with: @peirt.sku
    fill_in "Transaction date", with: @peirt.transaction_date
    fill_in "Transaction type", with: @peirt.transaction_type
    fill_in "User", with: @peirt.user_id
    click_on "Create Peirt"

    assert_text "Peirt was successfully created"
    click_on "Back"
  end

  test "updating a Peirt" do
    visit peirts_url
    click_on "Edit", match: :first

    fill_in "Amount", with: @peirt.amount
    fill_in "Entry no", with: @peirt.entry_no
    fill_in "Fiscal year", with: @peirt.fiscal_year_id
    fill_in "Item", with: @peirt.item_id
    fill_in "Office", with: @peirt.office_id
    fill_in "Office purchase entry item", with: @peirt.office_purchase_entry_item_id
    fill_in "Project", with: @peirt.project_id
    fill_in "Project item", with: @peirt.project_item_id
    fill_in "Project release item", with: @peirt.project_release_item_id
    fill_in "Quantity", with: @peirt.quantity
    fill_in "Rate", with: @peirt.rate
    fill_in "Remarks", with: @peirt.remarks
    fill_in "Sku", with: @peirt.sku
    fill_in "Transaction date", with: @peirt.transaction_date
    fill_in "Transaction type", with: @peirt.transaction_type
    fill_in "User", with: @peirt.user_id
    click_on "Update Peirt"

    assert_text "Peirt was successfully updated"
    click_on "Back"
  end

  test "destroying a Peirt" do
    visit peirts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Peirt was successfully destroyed"
  end
end
