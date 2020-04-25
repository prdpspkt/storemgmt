class AddPoolItemIdToOfficeItems < ActiveRecord::Migration[5.2]
  def change
    add_column :office_items, :pool_item_id, :integer
  end
end
