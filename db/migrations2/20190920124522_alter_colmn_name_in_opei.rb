class AlterColmnNameInOpei < ActiveRecord::Migration[5.2]
  def change
    rename_column :office_purchase_entry_items, :item_registration_page_no, :item_register_page_no
  end
end
