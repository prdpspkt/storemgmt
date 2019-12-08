class AddModelAndIdentificationToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :model_no, :string
    add_column :items, :item_identification_no, :string
  end
end
