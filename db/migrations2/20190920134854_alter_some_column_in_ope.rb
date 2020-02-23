class AlterSomeColumnInOpe < ActiveRecord::Migration[5.2]
  def change
    rename_column :office_purchase_entries, :store_cheif_sign_date, :store_chief_signed_date
  end
end
