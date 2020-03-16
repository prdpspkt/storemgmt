class AddRateToOfficeHandoverFormItems < ActiveRecord::Migration[5.2]
  def change
    add_column :office_handover_form_items, :rate, :decimal
  end
end
