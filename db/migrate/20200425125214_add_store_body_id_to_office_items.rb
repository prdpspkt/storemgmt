class AddStoreBodyIdToOfficeItems < ActiveRecord::Migration[5.2]
  def change
    add_column :office_items, :sotre_body_id, :integer
  end
end
