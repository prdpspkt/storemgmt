class AlterOfficeItemDisposals < ActiveRecord::Migration[5.2]
  def change
    remove_column :office_item_disposals, :store_chief_name
    add_column :office_item_disposals, :store_keeper_signed_date, :datetime
    add_column :office_item_disposals, :section_chief_signed_date, :datetime
    add_column :office_item_disposals, :office_chief_signed_date, :datetime
  end
end
