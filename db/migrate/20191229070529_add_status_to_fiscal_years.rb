class AddStatusToFiscalYears < ActiveRecord::Migration[5.2]
  def change
    add_column :fiscal_years, :status, :boolean
  end
end
