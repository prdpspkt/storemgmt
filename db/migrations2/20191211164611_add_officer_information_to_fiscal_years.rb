class AddOfficerInformationToFiscalYears < ActiveRecord::Migration[5.2]
  def change
    add_column :fiscal_years, :store_chief, :string
    add_column :fiscal_years, :office_chief, :string
    add_column :fiscal_years, :section_chief, :string
  end
end
