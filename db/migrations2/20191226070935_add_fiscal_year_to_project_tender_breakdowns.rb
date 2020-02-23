class AddFiscalYearToProjectTenderBreakdowns < ActiveRecord::Migration[5.2]
  def change
    add_column :project_tender_breakdowns, :fiscal_year_id, :integer
    add_column :project_tender_breakdowns, :fy, :string
    rename_column  :project_tender_breakdowns, :project_tender_id, :project_purchase_tender_id
  end
end
