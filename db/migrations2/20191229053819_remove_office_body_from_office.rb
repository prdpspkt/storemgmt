class RemoveOfficeBodyFromOffice < ActiveRecord::Migration[5.2]
  def change
    remove_column :offices, :office_chief
    remove_column :offices, :section_chief
    remove_column :offices, :store_chief
  end
end
