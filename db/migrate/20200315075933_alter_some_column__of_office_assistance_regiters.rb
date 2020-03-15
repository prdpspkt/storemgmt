class AlterSomeColumnOfOfficeAssistanceRegiters < ActiveRecord::Migration[5.2]
  def change
    remove_column :office_item_assistance_registers, :name_of_item_ne
    remove_column :office_item_assistance_registers, :name_of_item_en
    remove_column :office_item_assistance_registers, :unit_ne
    remove_column :office_item_assistance_registers, :unit_en
    remove_column :office_item_assistance_registers, :item_register_page_no
    remove_column :office_item_assistance_registers, :office_item_id
    remove_column :office_item_assistance_registers, :fy
    add_column :office_item_assistance_registers, :personnel_name_ne, :string
    add_column :office_item_assistance_registers, :designation, :string
    add_column :office_item_assistance_registers, :personnel_id, :integer
  end
end
