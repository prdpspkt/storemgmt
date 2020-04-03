class AddAColumn2ToOfficeItemDisposalItems < ActiveRecord::Migration[5.2]
  def change
    add_column :office_item_disposal_items, :store_body_id, :integer
  end
end
