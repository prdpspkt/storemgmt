class AddItemClassificationToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :office_pool_items, :item_classification_no, :integer
  end
end
