class AddOfficeHandoverFormIdToOfficeHandoverFormItems < ActiveRecord::Migration[5.2]
  def change
    add_column :office_handover_form_items, :office_handover_form_id, :integer
  end
end
