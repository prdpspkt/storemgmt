class AddOfficeItemIdToItemAssistanceRegisterItems < ActiveRecord::Migration[5.2]
  def change
    add_column :item_assistance_register_items, :office_item_id, :integer
  end
end
