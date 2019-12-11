class CreateOfficeHandoverFormItems < ActiveRecord::Migration[5.2]
  def change
    create_table :office_handover_form_items do |t|
      t.integer :item_classification_no
      t.integer :item_register_page_no
      t.string :name_of_item_ne
      t.string :name_of_item_en
      t.string :specification
      t.integer :item_identification_no
      t.string :model_no
      t.string :unit_ne
      t.string :unit_en
      t.decimal :quantity
      t.decimal :amount
      t.datetime :received_date
      t.string :physical_status
      t.string :fy
      t.integer :fiscal_year_id
      t.integer :user_id
      t.integer :office_id
      t.integer :project_id
      t.integer :office_handover_form_id
      t.integer :item_id

      t.timestamps
    end
  end
end
