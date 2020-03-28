class RemoveSomeColumnsFormProjectPurchaseEntry < ActiveRecord::Migration[5.2]
  def change
    remove_column :project_purchase_entry_items, :name_of_item_en
    remove_column :project_purchase_entry_items, :name_of_item_ne
    remove_column :project_purchase_entry_items, :unit_en
    remove_column :project_purchase_entry_items, :unit_ne
    remove_column :project_purchase_entry_items, :item_classification_no
    remove_column :project_purchase_entry_items, :item_register_page_no
  end
end
