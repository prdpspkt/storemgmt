class CreateItemDisposalItems < ActiveRecord::Migration[5.2]
  def change
    create_table :item_disposal_items do |t|
      t.integer :item_classification_no
      t.integer :item_register_page_no
      t.integer :item_id
      t.string :name_of_item_ne
      t.string :name_of_item_en
      t.string :unit_ne
      t.string :unit_ne
      t.boolean :is_office_item
      t.boolean :is_project_item
      t.string :specification
      t.datetime :received_date
      t.string :used_year
      t.decimal :quantity
      t.decimal :amount
      t.decimal :current_marked_price
      t.string :reason_for_disposal
      t.string :remarks
      t.integer :office_id
      t.integer :user_id
      t.string :fy
      t.integer :fiscal_year_id

      t.timestamps
    end
  end
end
