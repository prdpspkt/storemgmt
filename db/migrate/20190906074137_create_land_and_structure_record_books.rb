class CreateLandAndStructureRecordBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :land_and_structure_record_books do |t|
      t.string :store_chief_name
      t.string :store_chief_designation
      t.datetime :store_chief_signed_date
      t.string :office_chief_name
      t.string :office_chief_designation
      t.string :office_chief_signed_date
      t.integer :user_id
      t.string :fy
      t.integer :fiscal_year_id
      t.integer :office_id

      t.timestamps
    end
  end
end
