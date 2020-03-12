class AddMissingDateToOfficeHandoverForms < ActiveRecord::Migration[5.2]
  def change
    add_column :office_handover_forms, :office_chief_signed_date, :datetime
    add_column :office_handover_forms, :section_chief_signed_date, :datetime
    add_column :office_handover_forms, :store_keeper_signed_date, :datetime
  end
end
