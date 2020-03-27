class CreateProjectPurchaseEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :project_project_purchase_entries do |t|
      t.datetime :entry_date
      t.integer :entry_no
      t.boolean :entry_generated
      t.boolean :accepted
      t.datetime :store_keeper_signed_date
      t.datetime :section_chief_signed_date
      t.datetime :office_chief_signed_date
      t.integer :user_id
      t.integer :office_id
      t.integer :fiscal_year_id
      t.integer :store_body_id
      t.integer :purchase_order_id
      t.integer :tender_id
      t.integer :project_id

      t.timestamps
    end
  end
end
