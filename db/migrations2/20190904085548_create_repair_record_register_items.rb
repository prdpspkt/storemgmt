class CreateRepairRecordRegisterItems < ActiveRecord::Migration[5.2]
  def change
    create_table :repair_record_register_items do |t|
      t.datetime :date
      t.integer :repair_application_no
      t.string :applicat_name
      t.string :changed_part_name
      t.decimal :changesd_part_cost
      t.string :other_expense
      t.decimal :other_expense_cost
      t.decimal :total_expense
      t.string :vendor_name
      t.string :justified_by
      t.string :remarks
      t.integer :user_id
      t.integer :office_id
      t.string :fy
      t.integer :fiscal_year_id
      t.integer :repair_record_register_id

      t.timestamps
    end
  end
end
