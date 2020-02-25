class AddItemCategoryToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :item_category_id, :integer
  end
end
