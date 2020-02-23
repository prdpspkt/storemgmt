class AddPtbiIdTo < ActiveRecord::Migration[5.2]
  def change
    add_column :pneirts, :project_tender_breakdown_item_id, :integer
    add_column :peirts, :project_tender_breakdown_item_id, :integer
  end
end
