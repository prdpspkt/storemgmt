class CreateProjectSapatiRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :project_sapati_records do |t|
      t.integer :from
      t.integer :to
      t.integer :from_item_id
      t.integer :to_item_id
      t.decimal :quantity
      t.datetime :date
      t.integer :type
      t.integer :office_id
      t.integer :user_id
      t.integer :fiscal_year_id
      t.integer :store_body_id

      t.timestamps
    end
  end
end
