class RenameOfficeItemIdOfOfficeItemAssistanceRegisterItems < ActiveRecord::Migration[5.2]
  def change
    rename_table :item_assistance_register_items, :office_item_assistance_register_items
    rename_column :office_item_assistance_register_items, :office_item_id, :item_id
    remove_column :office_item_assistance_register_items, :name_of_item_ne
    remove_column :office_item_assistance_register_items, :name_of_item_en
    remove_column :office_item_assistance_register_items, :name_of_user
  end
end
