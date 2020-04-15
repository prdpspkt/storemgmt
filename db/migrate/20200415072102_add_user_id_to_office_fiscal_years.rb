class AddUserIdToOfficeFiscalYears < ActiveRecord::Migration[5.2]
  def change
    add_column :office_fiscal_years, :user_id, :integer
  end
end
