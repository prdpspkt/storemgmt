class RenameTabless < ActiveRecord::Migration[5.2]
  def change
    rename_table :office_fiscal_year, :office_fiscal_years

  end
end
