class AddSomeExtraFieldToProjectTenderItems < ActiveRecord::Migration[5.2]
  def change
    add_column :project_tender_items, :item_classification_no, :integer
    add_column :project_tender_items, :specification, :string
    add_column :project_tender_items, :item_identification_no, :string
    add_column :project_tender_items, :model_no, :string
    add_column :project_tender_items, :size, :string
    add_column :project_tender_items, :approx_age, :string
    add_column :project_tender_items, :source, :string
    add_column :project_tender_items, :is_vatable, :boolean
  end
end
