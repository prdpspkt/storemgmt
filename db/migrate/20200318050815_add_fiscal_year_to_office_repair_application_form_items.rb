class AddFiscalYearToOfficeRepairApplicationFormItems < ActiveRecord::Migration[5.2]
  def change
    add_column :office_repair_application_form_items, :fiscal_year_id, :integer
  end
end
