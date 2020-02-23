class CreateProjectPurchaseTenders < ActiveRecord::Migration[5.2]
  def change
    create_table :project_purchase_tenders do |t|
      t.integer :office_id
      t.integer :user_id
      t.integer :fiscal_yeaer_id
      t.string :tender_no
      t.string :tender_name
      t.datetime :tender_date
      t.boolean :marked_as_final
      t.string :bidders_name
      t.string :bidders_address

      t.timestamps
    end
  end
end
