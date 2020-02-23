class AddModelAndIdentificationToOfficeItems < ActiveRecord::Migration[5.2]
  def change
    add_column :office_items, :model_no, :string
    add_column :office_items, :item_identification_no, :string
  end
end
