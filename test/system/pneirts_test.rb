require "application_system_test_case"

class PneirtsTest < ApplicationSystemTestCase
  setup do
    @pneirt = pneirts(:one)
  end

  test "visiting the index" do
    visit pneirts_url
    assert_selector "h1", text: "Pneirts"
  end

  test "creating a Pneirt" do
    visit pneirts_url
    click_on "New Pneirt"

    fill_in "Amount", with: @pneirt.amount
    fill_in "Approx age", with: @pneirt.approx_age
    fill_in "Breakdown", with: @pneirt.breakdown_id
    fill_in "Country", with: @pneirt.country
    fill_in "Entry no", with: @pneirt.entry_no
    fill_in "Fiscal year", with: @pneirt.fiscal_year_id
    fill_in "Item", with: @pneirt.item_id
    fill_in "Item identificaiton no", with: @pneirt.item_identificaiton_no
    fill_in "Model no", with: @pneirt.model_no
    fill_in "Office", with: @pneirt.office_id
    fill_in "Project handover form", with: @pneirt.project_handover_form_id
    fill_in "Project item", with: @pneirt.project_item_id
    fill_in "Project purchase entry item", with: @pneirt.project_purchase_entry_item_id
    fill_in "Quantity", with: @pneirt.quantity
    fill_in "Rate", with: @pneirt.rate
    fill_in "Remarks", with: @pneirt.remarks
    fill_in "Size", with: @pneirt.size
    fill_in "Sku", with: @pneirt.sku
    fill_in "Source", with: @pneirt.source
    fill_in "Transaction date", with: @pneirt.transaction_date
    fill_in "Transaction type", with: @pneirt.transaction_type
    fill_in "User", with: @pneirt.user_id
    click_on "Create Pneirt"

    assert_text "Pneirt was successfully created"
    click_on "Back"
  end

  test "updating a Pneirt" do
    visit pneirts_url
    click_on "Edit", match: :first

    fill_in "Amount", with: @pneirt.amount
    fill_in "Approx age", with: @pneirt.approx_age
    fill_in "Breakdown", with: @pneirt.breakdown_id
    fill_in "Country", with: @pneirt.country
    fill_in "Entry no", with: @pneirt.entry_no
    fill_in "Fiscal year", with: @pneirt.fiscal_year_id
    fill_in "Item", with: @pneirt.item_id
    fill_in "Item identificaiton no", with: @pneirt.item_identificaiton_no
    fill_in "Model no", with: @pneirt.model_no
    fill_in "Office", with: @pneirt.office_id
    fill_in "Project handover form", with: @pneirt.project_handover_form_id
    fill_in "Project item", with: @pneirt.project_item_id
    fill_in "Project purchase entry item", with: @pneirt.project_purchase_entry_item_id
    fill_in "Quantity", with: @pneirt.quantity
    fill_in "Rate", with: @pneirt.rate
    fill_in "Remarks", with: @pneirt.remarks
    fill_in "Size", with: @pneirt.size
    fill_in "Sku", with: @pneirt.sku
    fill_in "Source", with: @pneirt.source
    fill_in "Transaction date", with: @pneirt.transaction_date
    fill_in "Transaction type", with: @pneirt.transaction_type
    fill_in "User", with: @pneirt.user_id
    click_on "Update Pneirt"

    assert_text "Pneirt was successfully updated"
    click_on "Back"
  end

  test "destroying a Pneirt" do
    visit pneirts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Pneirt was successfully destroyed"
  end
end
