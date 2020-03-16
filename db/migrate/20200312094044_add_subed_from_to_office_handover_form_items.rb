class AddSubedFromToOfficeHandoverFormItems < ActiveRecord::Migration[5.2]
  def change
    add_column :office_handover_form_items, :subed_from, :integer
  end
end
