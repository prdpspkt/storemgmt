class CreatePneirts < ActiveRecord::Migration[5.2]
  def change
    create_table :pneirts do |t|
      t.string :model_no
      t.string :item_identificaiton_no
      t.string :country
      t.integer :project_item_id
      t.integer :item_id
      t.integer :office_id
      t.integer :user_id
      t.integer :fiscal_year_id
      t.datetime :transaction_date
      t.integer :transaction_type
      t.decimal :rate
      t.decimal :amount
      t.decimal :quantity
      t.integer :project_purchase_entry_item_id
      t.integer :breakdown_id
      t.string :remarks
      t.decimal :sku
      t.integer :project_handover_form_id
      t.integer :entry_no
      t.string :country
      t.string :size
      t.string :approx_age
      t.string :source

      t.timestamps
    end
  end
end
