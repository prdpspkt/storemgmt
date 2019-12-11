class AddHandoveredFromToOfficeHandoverFormItems < ActiveRecord::Migration[5.2]
  def change
    add_column :office_handover_form_items, :handovered_from, :integer
  end
end
