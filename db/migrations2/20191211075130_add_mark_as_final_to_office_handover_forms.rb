class AddMarkAsFinalToOfficeHandoverForms < ActiveRecord::Migration[5.2]
  def change
    add_column :office_handover_forms, :marked_as_final, :boolean
  end
end
