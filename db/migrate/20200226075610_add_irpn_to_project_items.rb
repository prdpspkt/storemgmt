class AddIrpnToProjectItems < ActiveRecord::Migration[5.2]
  def change
    add_column :project_items, :item_classification_no, :integer
    add_column :project_items, :item_register_page_no, :integer
  end
end
