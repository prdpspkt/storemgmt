class AddAcceptedToOfficeItemAssistanceRegisterItems < ActiveRecord::Migration[5.2]
  def change
    add_column :office_item_assistance_register_items, :accepted, :boolean
  end
end
