class CreateFiscalYears < ActiveRecord::Migration[5.2]
  def change
    create_table :fiscal_years do |t|
      t.string :fy
      t.timestamps
    end
  end
end
