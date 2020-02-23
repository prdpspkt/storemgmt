class AddHandoverItemIdToOneirts < ActiveRecord::Migration[5.2]
  def change
    add_column :oneirts, :office_handover_form_item_id, :integer
  end
end
