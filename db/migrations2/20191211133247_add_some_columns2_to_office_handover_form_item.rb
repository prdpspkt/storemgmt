class AddSomeColumns2ToOfficeHandoverFormItem < ActiveRecord::Migration[5.2]
  def change
    add_column :office_handover_form_items, :country, :string
    add_column :office_handover_form_items, :size, :string
    add_column :office_handover_form_items, :age_approx, :string
  end
end
