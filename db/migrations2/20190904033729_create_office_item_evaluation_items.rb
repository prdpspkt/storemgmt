class CreateOfficeItemEvaluationItems < ActiveRecord::Migration[5.2]
  def change
    create_table :office_item_evaluation_items do |t|
      t.integer :item_classification_no
      t.integer :item_register_page_no
      t.string :name_of_item_en
      t.string :name_of_item_ne
      t.string :unit_ne
      t.string :unit_en
      t.decimal :quantity
      t.decimal :amount
      t.decimal :mached
      t.decimal :unmatched
      t.decimal :decreased_quantity
      t.decimal :increased_quantity
      t.decimal :decreased_increased_quantity
      t.decimal :working
      t.decimal :notworking
      t.decimal :to_be_repaired
      t.decimal :to_be_auctioned
      t.decimal :to_be_dispose
      t.decimal :to_be_conserved
      t.decimal :total_amount
      t.string :remarks
      t.integer :item_id
      t.integer :office_item_id
      t.integer :user_id
      t.integer :office_id
      t.string :fy
      t.integer :fiscal_year_id

      t.timestamps
    end
  end
end
