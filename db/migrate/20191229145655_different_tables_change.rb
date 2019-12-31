class DifferentTablesChange < ActiveRecord::Migration[5.2]
  def change
    rename_column :store_bodies, :office_chief, :office_chief_name
    rename_column :store_bodies, :section_chief, :section_chief_name
    remove_column :store_bodies, :fiscal_year_id
    remove_column :store_bodies, :status
  end
end
