class AddSomeExtraAcFieldToProjectTenderItems < ActiveRecord::Migration[5.2]
  def change
    add_column :project_tender_items, :amount_without_vat, :decimal
    add_column :project_tender_items, :vat, :decimal
    add_column :project_tender_items, :other_expense, :decimal
  end
end
