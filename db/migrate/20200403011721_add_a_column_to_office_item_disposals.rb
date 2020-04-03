class AddAColumnToOfficeItemDisposals < ActiveRecord::Migration[5.2]
  def change
    add_column :office_item_disposals, :accepted, :boolean
    add_column :office_item_disposals, :entry_generated, :boolean
  end
end
