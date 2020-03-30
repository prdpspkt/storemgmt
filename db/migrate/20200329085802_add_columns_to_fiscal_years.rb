class AddColumnsToFiscalYears < ActiveRecord::Migration[5.2]
  def change
    add_column :fiscal_years, :start_date, :datetime
    add_column :fiscal_years, :closing_date, :datetime
  end
end
