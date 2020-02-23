class CreateRepairApplicationForms < ActiveRecord::Migration[5.2]
  def change
    create_table :repair_application_forms do |t|
      t.integer :application_no
      t.datetime :date
      t.string :year
      t.string :month
      t.string :vendor_name
      t.string :vendor_address
      t.string :vendor_phone
      t.string :vendor_registration_no
      t.string :vendor_pan
      t.datetime :within_date
      t.string :office_name
      t.string :office_address
      t.string :section_chief_name
      t.string :section_chief_designation
      t.datetime :section_chief_signed_date
      t.string :technical_person_name
      t.string :technical_person_designation
      t.datetime :technical_person_signed_date
      t.string :office_chief_name
      t.string :office_chief_designation
      t.datetime :office_chief_signed_date
      t.integer :office_id
      t.string :fy
      t.integer :fiscal_year_id
      t.integer :user_id

      t.timestamps
    end
  end
end
