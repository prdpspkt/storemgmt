class AddItemClassificatighonToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :office_pool_items, :office_id, :integer
    add_column :office_pool_items, :user_id, :integer
  end
end
