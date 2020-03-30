class AddUserIdToStoreBodies < ActiveRecord::Migration[5.2]
  def change
    add_column :office_store_bodies, :user_id, :integer
  end
end
