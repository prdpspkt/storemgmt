class AddItemClassificationNoToOfficeItems < ActiveRecord::Migration[5.2]
  def change
    add_column :office_items, :item_classification_no, :integer
  end
end
