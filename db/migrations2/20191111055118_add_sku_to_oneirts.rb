class AddSkuToOneirts < ActiveRecord::Migration[5.2]
  def change
    add_column :oneirts, :sku, :decimal
    add_column :oneirts, :office_release_item_id, :integer
  end
end
