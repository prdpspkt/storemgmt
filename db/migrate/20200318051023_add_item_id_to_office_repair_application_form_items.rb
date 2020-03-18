class AddItemIdToOfficeRepairApplicationFormItems < ActiveRecord::Migration[5.2]
  def change
    add_column :office_repair_application_form_items, :item_id, :integer
    remove_column :office_repair_application_form_items, :name_of_item_en
    remove_column :office_repair_application_form_items, :name_of_item_ne
  end
end
