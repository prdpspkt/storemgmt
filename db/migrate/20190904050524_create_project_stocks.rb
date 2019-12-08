class CreateProjectStocks < ActiveRecord::Migration[5.2]
  def change
    create_table :project_stocks do |t|
      t.string :fy
      t.string :store_chief_name
      t.string :store_chief_designation
      t.datetime :store_chief_sign_date
      t.string :section_chief_name
      t.string :section_chief_designation
      t.datetime :section_chief_signed_date
      t.string :office_chief_name
      t.string :office_chief_designation
      t.datetime :office_chief_signed_date
      t.integer :office_id
      t.integer :user_id
      t.integer :fiscal_year_id

      t.timestamps
    end
  end
end
