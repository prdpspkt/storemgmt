class AddOfficeItemIdToOfficeHandoverFormItems < ActiveRecord::Migration[5.2]
  def change
    add_column :office_handover_form_items, :office_item_id, :integer
  end
end
