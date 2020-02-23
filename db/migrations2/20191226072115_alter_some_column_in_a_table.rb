class AlterSomeColumnInATable < ActiveRecord::Migration[5.2]
  def change
    rename_column :project_purchase_tenders, :fiscal_yeaer_id, :fiscal_year_id
  end
end
