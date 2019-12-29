class AddOrRemoveSomeColumnsFromFiscalYears < ActiveRecord::Migration[5.2]
  def change
    remove_column :fiscal_years, :office_chief
    remove_column :fiscal_years, :section_chief
    remove_column :fiscal_years, :store_chief

    add_column :fiscal_years, :office_id, :integer
  end
end
