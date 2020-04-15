class AddWorkingToOfficePersonnels < ActiveRecord::Migration[5.2]
  def change
    add_column :office_personnels, :working, :boolean
  end
end
