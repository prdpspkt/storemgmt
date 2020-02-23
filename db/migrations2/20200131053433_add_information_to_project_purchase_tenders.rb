class AddInformationToProjectPurchaseTenders < ActiveRecord::Migration[5.2]
  def change
    add_column :project_purchase_tenders, :store_keeper_name, :string
    add_column :project_purchase_tenders, :store_keeper_designation, :string
    add_column :project_purchase_tenders, :section_chief_name, :string
    add_column :project_purchase_tenders, :section_chief_designation, :string
    add_column :project_purchase_tenders, :office_chief_name, :string
    add_column :project_purchase_tenders, :office_chief_designation, :string
  end
end
