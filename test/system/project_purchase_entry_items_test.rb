require "application_system_test_case"

class ProjectPurchaseEntryItemsTest < ApplicationSystemTestCase
  setup do
    @project_purchase_entry_item = project_purchase_entry_items(:one)
  end

  test "visiting the index" do
    visit project_purchase_entry_items_url
    assert_selector "h1", text: "Project Purchase Entry Items"
  end

  test "creating a Project purchase entry item" do
    visit project_purchase_entry_items_url
    click_on "New Project Purchase Entry Item"

    fill_in "Amount", with: @project_purchase_entry_item.amount
    fill_in "Amount without vat", with: @project_purchase_entry_item.amount_without_vat
    fill_in "Approx age", with: @project_purchase_entry_item.approx_age
    fill_in "Country", with: @project_purchase_entry_item.country
    fill_in "Fiscal year", with: @project_purchase_entry_item.fiscal_year_id
    fill_in "Fy", with: @project_purchase_entry_item.fy
    check "Is vatable" if @project_purchase_entry_item.is_vatable
    fill_in "Item classification no", with: @project_purchase_entry_item.item_classification_no
    fill_in "Item", with: @project_purchase_entry_item.item_id
    fill_in "Item identification no", with: @project_purchase_entry_item.item_identification_no
    fill_in "Item register page no", with: @project_purchase_entry_item.item_register_page_no
    fill_in "Model no", with: @project_purchase_entry_item.model_no
    fill_in "Name of item en", with: @project_purchase_entry_item.name_of_item_en
    fill_in "Name of item ne", with: @project_purchase_entry_item.name_of_item_ne
    fill_in "Office", with: @project_purchase_entry_item.office_id
    fill_in "Other expenses", with: @project_purchase_entry_item.other_expenses
    fill_in "Project item", with: @project_purchase_entry_item.project_item_id
    fill_in "Project purchase entry", with: @project_purchase_entry_item.project_purchase_entry_id
    fill_in "Quantity", with: @project_purchase_entry_item.quantity
    fill_in "Rate", with: @project_purchase_entry_item.rate
    fill_in "Remarks", with: @project_purchase_entry_item.remarks
    fill_in "Size", with: @project_purchase_entry_item.size
    fill_in "Source", with: @project_purchase_entry_item.source
    fill_in "Specification", with: @project_purchase_entry_item.specification
    fill_in "Total amount", with: @project_purchase_entry_item.total_amount
    fill_in "Unit en", with: @project_purchase_entry_item.unit_en
    fill_in "Unit ne", with: @project_purchase_entry_item.unit_ne
    fill_in "User", with: @project_purchase_entry_item.user_id
    fill_in "Vat", with: @project_purchase_entry_item.vat
    click_on "Create Project purchase entry item"

    assert_text "Project purchase entry item was successfully created"
    click_on "Back"
  end

  test "updating a Project purchase entry item" do
    visit project_purchase_entry_items_url
    click_on "Edit", match: :first

    fill_in "Amount", with: @project_purchase_entry_item.amount
    fill_in "Amount without vat", with: @project_purchase_entry_item.amount_without_vat
    fill_in "Approx age", with: @project_purchase_entry_item.approx_age
    fill_in "Country", with: @project_purchase_entry_item.country
    fill_in "Fiscal year", with: @project_purchase_entry_item.fiscal_year_id
    fill_in "Fy", with: @project_purchase_entry_item.fy
    check "Is vatable" if @project_purchase_entry_item.is_vatable
    fill_in "Item classification no", with: @project_purchase_entry_item.item_classification_no
    fill_in "Item", with: @project_purchase_entry_item.item_id
    fill_in "Item identification no", with: @project_purchase_entry_item.item_identification_no
    fill_in "Item register page no", with: @project_purchase_entry_item.item_register_page_no
    fill_in "Model no", with: @project_purchase_entry_item.model_no
    fill_in "Name of item en", with: @project_purchase_entry_item.name_of_item_en
    fill_in "Name of item ne", with: @project_purchase_entry_item.name_of_item_ne
    fill_in "Office", with: @project_purchase_entry_item.office_id
    fill_in "Other expenses", with: @project_purchase_entry_item.other_expenses
    fill_in "Project item", with: @project_purchase_entry_item.project_item_id
    fill_in "Project purchase entry", with: @project_purchase_entry_item.project_purchase_entry_id
    fill_in "Quantity", with: @project_purchase_entry_item.quantity
    fill_in "Rate", with: @project_purchase_entry_item.rate
    fill_in "Remarks", with: @project_purchase_entry_item.remarks
    fill_in "Size", with: @project_purchase_entry_item.size
    fill_in "Source", with: @project_purchase_entry_item.source
    fill_in "Specification", with: @project_purchase_entry_item.specification
    fill_in "Total amount", with: @project_purchase_entry_item.total_amount
    fill_in "Unit en", with: @project_purchase_entry_item.unit_en
    fill_in "Unit ne", with: @project_purchase_entry_item.unit_ne
    fill_in "User", with: @project_purchase_entry_item.user_id
    fill_in "Vat", with: @project_purchase_entry_item.vat
    click_on "Update Project purchase entry item"

    assert_text "Project purchase entry item was successfully updated"
    click_on "Back"
  end

  test "destroying a Project purchase entry item" do
    visit project_purchase_entry_items_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Project purchase entry item was successfully destroyed"
  end
end
