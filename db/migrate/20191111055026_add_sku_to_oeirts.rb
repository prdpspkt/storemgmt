class AddSkuToOeirts < ActiveRecord::Migration[5.2]
  def change
    add_column :oeirts, :sku, :decimal
    add_column :oeirts, :office_release_item_id, :integer
  end
end
