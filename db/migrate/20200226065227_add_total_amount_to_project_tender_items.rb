class AddTotalAmountToProjectTenderItems < ActiveRecord::Migration[5.2]
  def change
    add_column :project_tender_items, :total_amount, :decimal
  end
end
