class RenameTables < ActiveRecord::Migration[5.2]
  def change
    rename_table :offices, :office_offices
    rename_table :active_fiscal_years, :office_active_fiscal_years
    rename_table :fiscal_years, :office_fiscal_year
  end
end
