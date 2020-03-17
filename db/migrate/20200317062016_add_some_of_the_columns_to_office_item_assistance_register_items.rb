class AddSomeOfTheColumnsToOfficeItemAssistanceRegisterItems < ActiveRecord::Migration[5.2]
  def change
    add_column :office_item_assistance_register_items, :returned_by, :string
  end
end
