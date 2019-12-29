class CreateActiveFiscalYears < ActiveRecord::Migration[5.2]
  def change
    create_table :active_fiscal_years do |t|
      t.string :fy
      t.integer :fiscal_year_id
      t.integer :office_id
      t.timestamps
    end
  end
end
