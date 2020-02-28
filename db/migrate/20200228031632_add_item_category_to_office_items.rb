class AddItemCategoryToOfficeItems < ActiveRecord::Migration[5.2]
  def change
    add_column :office_items, :item_category_id, :integer
  end
end
