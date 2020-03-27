class AddItemRegisterPageNoToProjectProjectItems < ActiveRecord::Migration[5.2]
  def change
    add_column :project_project_items, :item_register_page_no, :integer
  end
end
