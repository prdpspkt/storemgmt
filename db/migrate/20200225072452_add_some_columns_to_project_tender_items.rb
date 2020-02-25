class AddSomeColumnsToProjectTenderItems < ActiveRecord::Migration[5.2]
  def change
    add_column :project_tender_items, :country, :string
    add_column :project_tender_items, :remarks, :string
  end
end
