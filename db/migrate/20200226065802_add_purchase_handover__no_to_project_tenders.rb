class AddPurchaseHandoverNoToProjectTenders < ActiveRecord::Migration[5.2]
  def change
    add_column :project_tenders, :purchase_handover_no, :string
  end
end
