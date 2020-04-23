class AddPersonnelToOfficeDemands < ActiveRecord::Migration[5.2]
  def change
    add_column :office_demands, :personnel_id, :integer
  end
end
