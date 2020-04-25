class AddFiscalYearIdToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :office_items, :fiscal_year_id, :integer
    add_column :project_items, :fiscal_year_id, :integer
    add_column :project_project_items, :fiscal_year_id, :integer
  end
end
