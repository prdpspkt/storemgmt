class CreateProjectMainNonExpensableItemRegisters < ActiveRecord::Migration[5.2]
  def change
    create_table :project_main_non_expensable_item_registers do |t|
      t.string :name_of_item_en
      t.string :name_of_item_ne
      t.string :unit_ne
      t.string :unit_en
      t.string :model_no
      t.string :item_identification_no
      t.string :specification
      t.string :fy
      t.integer :item_classification_no
      t.integer :item_register_page_no
      t.string :store_chief_name
      t.string :store_chief_designation
      t.date :store_chief_signed_date
      t.string :section_chief_name
      t.string :section_chief_designation
      t.datetime :section_chief_signed_date
      t.string :office_chief_name
      t.string :office_chief_designation
      t.string :office_chief_signed_date
      t.integer :office_id
      t.integer :user_id
      t.integer :fiscal_year_id
      t.integer :project_entry_item_id
      t.integer :item_id


      t.timestamps
    end
  end
end
