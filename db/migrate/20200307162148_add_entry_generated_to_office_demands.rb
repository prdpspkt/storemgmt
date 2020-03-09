class AddEntryGeneratedToOfficeDemands < ActiveRecord::Migration[5.2]
  def change
    add_column :office_demands, :entry_generated, :boolean
  end
end
