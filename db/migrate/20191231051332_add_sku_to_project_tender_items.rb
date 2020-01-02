class AddSkuToProjectTenderItems < ActiveRecord::Migration[5.2]
  def change
    add_column :project_tender_items, :sku, :decimal
  end
end
