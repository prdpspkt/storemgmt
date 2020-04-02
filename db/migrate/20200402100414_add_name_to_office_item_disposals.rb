class AddNameToOfficeItemDisposals < ActiveRecord::Migration[5.2]
  def change
    add_column :office_item_disposals, :description, :string
  end
end
