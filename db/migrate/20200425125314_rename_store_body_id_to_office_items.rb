class RenameStoreBodyIdToOfficeItems < ActiveRecord::Migration[5.2]
  def change
    rename_column :office_items, :sotre_body_id, :store_body_id
  end
end
