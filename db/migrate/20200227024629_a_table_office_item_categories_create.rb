class ATableOfficeItemCategoriesCreate < ActiveRecord::Migration[5.2]
  def change
    create_table "office_item_categories", force: :cascade do |t|
      t.string "name_ne"
      t.string "name_en"
      t.string "unit_ne"
      t.string "unit_en"
      t.integer "user_id"
      t.integer "office_id"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
  end
end
