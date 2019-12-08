class AddIarIdToItemAssistanceRegisterItems < ActiveRecord::Migration[5.2]
  def change
    add_column :item_assistance_register_items, :item_assistance_register_id, :integer
  end
end
