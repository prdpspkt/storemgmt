class AddHasProjectAccessToOffices < ActiveRecord::Migration[5.2]
  def change
    add_column :offices, :has_project_access, :boolean
  end
end
