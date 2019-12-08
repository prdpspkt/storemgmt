class AddSomeItemsToPurchaseEntry < ActiveRecord::Migration[5.2]
  def change
    add_column :office_purchase_entry_items, :country, :string
    add_column :office_purchase_entry_items, :size, :string
    add_column :office_purchase_entry_items, :approx_age, :string
    add_column :office_purchase_entry_items, :source, :string

    add_column :oneirts, :country, :string
    add_column :oneirts, :size, :string
    add_column :oneirts, :approx_age, :string
    add_column :oneirts, :source, :string
  end
end
