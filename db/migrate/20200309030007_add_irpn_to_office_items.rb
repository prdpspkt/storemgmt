class AddIrpnToOfficeItems < ActiveRecord::Migration[5.2]
  def change
    add_column :office_items, :item_register_page_no, :integer
  end
end
