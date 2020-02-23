class ChangeSomeColumns < ActiveRecord::Migration[5.2]
  def change
    rename_column :peirts, :office_purchase_entry_item_id, :project_purchase_entry_item_id
    rename_column :pneirts, :item_identificaiton_no, :item_identification_no
  end
end
