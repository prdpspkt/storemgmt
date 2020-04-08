class AddSomeImportantColumnsToOfficeStock < ActiveRecord::Migration[5.2]
  def change
    add_column :office_stock_items, :name_of_item_ne, :string
    add_column :office_stock_items, :item_classification_no, :integer
    add_column :office_stock_items, :item_register_page_no, :integer
    add_column :office_stock_items, :unit_ne, :string

    add_column :project_stock_items, :name_of_item_ne, :string
    add_column :project_stock_items, :item_classification_no, :integer
    add_column :project_stock_items, :item_register_page_no, :integer
    add_column :project_stock_items, :unit_ne, :string
  end
end
