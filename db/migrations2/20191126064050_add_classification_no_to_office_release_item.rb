class AddClassificationNoToOfficeReleaseItem < ActiveRecord::Migration[5.2]
  def change
    add_column :office_release_items, :item_classification_no, :integer
  end
end
