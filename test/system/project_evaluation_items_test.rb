require "application_system_test_case"

class ProjectEvaluationItemsTest < ApplicationSystemTestCase
  setup do
    @project_evaluation_item = project_evaluation_items(:one)
  end

  test "visiting the index" do
    visit project_evaluation_items_url
    assert_selector "h1", text: "Project Evaluation Items"
  end

  test "creating a Project evaluation item" do
    visit project_evaluation_items_url
    click_on "New Project Evaluation Item"

    fill_in "Amount", with: @project_evaluation_item.amount
    fill_in "Decreased quantity", with: @project_evaluation_item.decreased_quantity
    fill_in "Dein quantity", with: @project_evaluation_item.dein_quantity
    fill_in "Fiscal year", with: @project_evaluation_item.fiscal_year_id
    fill_in "Fy", with: @project_evaluation_item.fy
    fill_in "Increased quantity", with: @project_evaluation_item.increased_quantity
    fill_in "Item classification no", with: @project_evaluation_item.item_classification_no
    fill_in "Item", with: @project_evaluation_item.item_id
    fill_in "Item register page no", with: @project_evaluation_item.item_register_page_no
    fill_in "Mached", with: @project_evaluation_item.mached
    check "Marked as final" if @project_evaluation_item.marked_as_final
    fill_in "Name of item en", with: @project_evaluation_item.name_of_item_en
    fill_in "Name of item ne", with: @project_evaluation_item.name_of_item_ne
    fill_in "Not working", with: @project_evaluation_item.not_working
    fill_in "Office", with: @project_evaluation_item.office_id
    fill_in "Project item", with: @project_evaluation_item.project_item_id
    fill_in "Quantity", with: @project_evaluation_item.quantity
    fill_in "Remarks", with: @project_evaluation_item.remarks
    fill_in "To be auctioned", with: @project_evaluation_item.to_be_auctioned
    fill_in "To be conserved", with: @project_evaluation_item.to_be_conserved
    fill_in "To be dispose", with: @project_evaluation_item.to_be_dispose
    fill_in "To be repaired", with: @project_evaluation_item.to_be_repaired
    fill_in "Total amount", with: @project_evaluation_item.total_amount
    fill_in "Unit en", with: @project_evaluation_item.unit_en
    fill_in "Unit ne", with: @project_evaluation_item.unit_ne
    fill_in "Unmatched", with: @project_evaluation_item.unmatched
    fill_in "User", with: @project_evaluation_item.user_id
    fill_in "Working", with: @project_evaluation_item.working
    click_on "Create Project evaluation item"

    assert_text "Project evaluation item was successfully created"
    click_on "Back"
  end

  test "updating a Project evaluation item" do
    visit project_evaluation_items_url
    click_on "Edit", match: :first

    fill_in "Amount", with: @project_evaluation_item.amount
    fill_in "Decreased quantity", with: @project_evaluation_item.decreased_quantity
    fill_in "Dein quantity", with: @project_evaluation_item.dein_quantity
    fill_in "Fiscal year", with: @project_evaluation_item.fiscal_year_id
    fill_in "Fy", with: @project_evaluation_item.fy
    fill_in "Increased quantity", with: @project_evaluation_item.increased_quantity
    fill_in "Item classification no", with: @project_evaluation_item.item_classification_no
    fill_in "Item", with: @project_evaluation_item.item_id
    fill_in "Item register page no", with: @project_evaluation_item.item_register_page_no
    fill_in "Mached", with: @project_evaluation_item.mached
    check "Marked as final" if @project_evaluation_item.marked_as_final
    fill_in "Name of item en", with: @project_evaluation_item.name_of_item_en
    fill_in "Name of item ne", with: @project_evaluation_item.name_of_item_ne
    fill_in "Not working", with: @project_evaluation_item.not_working
    fill_in "Office", with: @project_evaluation_item.office_id
    fill_in "Project item", with: @project_evaluation_item.project_item_id
    fill_in "Quantity", with: @project_evaluation_item.quantity
    fill_in "Remarks", with: @project_evaluation_item.remarks
    fill_in "To be auctioned", with: @project_evaluation_item.to_be_auctioned
    fill_in "To be conserved", with: @project_evaluation_item.to_be_conserved
    fill_in "To be dispose", with: @project_evaluation_item.to_be_dispose
    fill_in "To be repaired", with: @project_evaluation_item.to_be_repaired
    fill_in "Total amount", with: @project_evaluation_item.total_amount
    fill_in "Unit en", with: @project_evaluation_item.unit_en
    fill_in "Unit ne", with: @project_evaluation_item.unit_ne
    fill_in "Unmatched", with: @project_evaluation_item.unmatched
    fill_in "User", with: @project_evaluation_item.user_id
    fill_in "Working", with: @project_evaluation_item.working
    click_on "Update Project evaluation item"

    assert_text "Project evaluation item was successfully updated"
    click_on "Back"
  end

  test "destroying a Project evaluation item" do
    visit project_evaluation_items_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Project evaluation item was successfully destroyed"
  end
end
