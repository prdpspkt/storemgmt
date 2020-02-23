class CreateLandAndStructureRecordBookItems < ActiveRecord::Migration[5.2]
  def change
    create_table :land_and_structure_record_book_items do |t|
      t.string :district
      t.string :local_level
      t.integer :ward_no
      t.string :map_sheet_no
      t.string :plot_no
      t.string :area
      t.string :type
      t.string :owner_name
      t.string :certificate_no
      t.datetime :received_date
      t.decimal :price
      t.decimal :structure_laying_land_area
      t.decimal :structure_covered_area
      t.string :structure_type
      t.datetime :decision_date
      t.decimal :structure_cost
      t.decimal :land_and_structure_total_cost
      t.datetime :evaluated_date
      t.decimal :evaluated_price
      t.string :remarks
      t.integer :user_id
      t.string :fy
      t.integer :fiscal_year_id
      t.integer :office_id
      t.integer :land_and_structure_record_book_id

      t.timestamps
    end
  end
end
