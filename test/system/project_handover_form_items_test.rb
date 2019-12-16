require "application_system_test_case"

class ProjectHandoverFormItemsTest < ApplicationSystemTestCase
  setup do
    @project_handover_form_item = project_handover_form_items(:one)
  end

  test "visiting the index" do
    visit project_handover_form_items_url
    assert_selector "h1", text: "Project Handover Form Items"
  end

  test "creating a Project handover form item" do
    visit project_handover_form_items_url
    click_on "New Project Handover Form Item"

    fill_in "Amount", with: @project_handover_form_item.amount
    fill_in "Approx age", with: @project_handover_form_item.approx_age
    fill_in "Country", with: @project_handover_form_item.country
    fill_in "Fiscal year", with: @project_handover_form_item.fiscal_year_id
    fill_in "Fy", with: @project_handover_form_item.fy
    fill_in "Handover form", with: @project_handover_form_item.handover_form_id
    fill_in "Item classification no", with: @project_handover_form_item.item_classification_no
    fill_in "Item", with: @project_handover_form_item.item_id
    fill_in "Item identification no", with: @project_handover_form_item.item_identification_no
    fill_in "Item register page no", with: @project_handover_form_item.item_register_page_no
    fill_in "Model no", with: @project_handover_form_item.model_no
    fill_in "Name of item en", with: @project_handover_form_item.name_of_item_en
    fill_in "Name of item ne", with: @project_handover_form_item.name_of_item_ne
    fill_in "Office", with: @project_handover_form_item.office_id
    fill_in "Physical status", with: @project_handover_form_item.physical_status
    fill_in "Project handover form", with: @project_handover_form_item.project_handover_form_id
    fill_in "Project", with: @project_handover_form_item.project_id
    fill_in "Project item", with: @project_handover_form_item.project_item_id
    fill_in "Quantity", with: @project_handover_form_item.quantity
    fill_in "Received date", with: @project_handover_form_item.received_date
    fill_in "Size", with: @project_handover_form_item.size
    fill_in "Source", with: @project_handover_form_item.source
    fill_in "Specification", with: @project_handover_form_item.specification
    fill_in "Unit en", with: @project_handover_form_item.unit_en
    fill_in "Unit ne", with: @project_handover_form_item.unit_ne
    fill_in "User", with: @project_handover_form_item.user_id
    click_on "Create Project handover form item"

    assert_text "Project handover form item was successfully created"
    click_on "Back"
  end

  test "updating a Project handover form item" do
    visit project_handover_form_items_url
    click_on "Edit", match: :first

    fill_in "Amount", with: @project_handover_form_item.amount
    fill_in "Approx age", with: @project_handover_form_item.approx_age
    fill_in "Country", with: @project_handover_form_item.country
    fill_in "Fiscal year", with: @project_handover_form_item.fiscal_year_id
    fill_in "Fy", with: @project_handover_form_item.fy
    fill_in "Handover form", with: @project_handover_form_item.handover_form_id
    fill_in "Item classification no", with: @project_handover_form_item.item_classification_no
    fill_in "Item", with: @project_handover_form_item.item_id
    fill_in "Item identification no", with: @project_handover_form_item.item_identification_no
    fill_in "Item register page no", with: @project_handover_form_item.item_register_page_no
    fill_in "Model no", with: @project_handover_form_item.model_no
    fill_in "Name of item en", with: @project_handover_form_item.name_of_item_en
    fill_in "Name of item ne", with: @project_handover_form_item.name_of_item_ne
    fill_in "Office", with: @project_handover_form_item.office_id
    fill_in "Physical status", with: @project_handover_form_item.physical_status
    fill_in "Project handover form", with: @project_handover_form_item.project_handover_form_id
    fill_in "Project", with: @project_handover_form_item.project_id
    fill_in "Project item", with: @project_handover_form_item.project_item_id
    fill_in "Quantity", with: @project_handover_form_item.quantity
    fill_in "Received date", with: @project_handover_form_item.received_date
    fill_in "Size", with: @project_handover_form_item.size
    fill_in "Source", with: @project_handover_form_item.source
    fill_in "Specification", with: @project_handover_form_item.specification
    fill_in "Unit en", with: @project_handover_form_item.unit_en
    fill_in "Unit ne", with: @project_handover_form_item.unit_ne
    fill_in "User", with: @project_handover_form_item.user_id
    click_on "Update Project handover form item"

    assert_text "Project handover form item was successfully updated"
    click_on "Back"
  end

  test "destroying a Project handover form item" do
    visit project_handover_form_items_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Project handover form item was successfully destroyed"
  end
end
