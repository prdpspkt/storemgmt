class AddSomeColumnsToOfficeRepiarApplicationFormItems < ActiveRecord::Migration[5.2]
  def change
    add_column :office_repair_application_form_items, :repaired_date, :datetime
    add_column :office_repair_application_form_items, :changed_part_name, :string
    add_column :office_repair_application_form_items, :changed_part_cost, :decimal
    add_column :office_repair_application_form_items, :other_expense, :string
    add_column :office_repair_application_form_items, :other_expense_cost, :decimal
    add_column :office_repair_application_form_items, :justified_by, :integer
    end
end
