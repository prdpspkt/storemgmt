class AddLedgerEntryGeneratedToOfficeHandoverForms < ActiveRecord::Migration[5.2]
  def change
    add_column :office_handover_forms, :entry_generated, :boolean
  end
end
