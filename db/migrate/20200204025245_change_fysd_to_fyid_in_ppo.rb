class ChangeFysdToFyidInPpo < ActiveRecord::Migration[5.2]
  def change
    rename_column :project_purchase_orders, :fiscal_year_signed_date, :fiscal_year_id
  end
end
