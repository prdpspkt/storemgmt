class AddOrRemoveColumnsFormItemDisposalItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :office_item_disposal_items, :is_office_item
    remove_column :office_item_disposal_items, :is_project_item
    remove_column :office_item_disposal_items, :name_of_item_ne
    remove_column :office_item_disposal_items, :name_of_item_en
    remove_column :office_item_disposal_items, :item_register_page_no
    remove_column :office_item_disposal_items, :item_classification_no
    add_column :office_item_disposal_items, :item_disposal_id, :integer
  end
end
