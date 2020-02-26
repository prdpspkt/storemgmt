class AddEntryDateToProjectTenders < ActiveRecord::Migration[5.2]
  def change
    add_column :project_tenders, :entry_date, :datetime
  end
end
