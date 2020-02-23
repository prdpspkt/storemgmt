class CreateProjectTenderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :project_tender_items do |t|
      t.string :name_of_item_ne
      t.string :name_of_item_en
      t.string :unit_ne
      t.string :unit_en
      t.decimal :quantity
      t.decimal :rate
      t.decimal :amount
      t.integer :office_id
      t.integer :user_id
      t.datetime :received_date
      t.integer :project_purchase_tender_id
      t.string :fy
      t.integer :fiscal_year_id

      t.timestamps
    end
  end
end
