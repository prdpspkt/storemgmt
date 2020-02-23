class CreateRentalRecordRegisterItems < ActiveRecord::Migration[5.2]
  def change
    create_table :rental_record_register_items do |t|
      t.datetime :date
      t.string :name_of_vendor
      t.string :address_of_vendor
      t.datetime :approval_date
      t.datetime :start_date
      t.datetime :end_date
      t.string :unit
      t.decimal :duration
      t.decimal :rate
      t.decimal :total_amount
      t.integer :receipt_or_voucher_no
      t.string :total_amount
      t.datetime :returned_date
      t.string :remarks
      t.integer :user_id
      t.integer :office_id
      t.string :fy
      t.integer :fiscal_year_id
      t.integer :rental_record_register_id

      t.timestamps
    end
  end
end
