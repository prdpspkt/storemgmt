class AlterTableRepairApplicationForm < ActiveRecord::Migration[5.2]
  def change
    rename_column :repair_application_forms, :tecnical_person_name, :technical_person_name
  end
end
