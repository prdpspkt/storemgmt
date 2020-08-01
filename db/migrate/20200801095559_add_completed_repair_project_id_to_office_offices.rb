class AddCompletedRepairProjectIdToOfficeOffices < ActiveRecord::Migration[5.2]
  def change
    add_column :office_offices, :completed_repair_project_id, :integer
  end
end
