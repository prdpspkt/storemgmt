class CreateHandoverForms < ActiveRecord::Migration[5.2]
  def change
    create_table :handover_forms do |t|
      t.datetime :decision_date
      t.string :fy
      t.integer :decision_no
      t.string :handovered_office_name
      t.datetime :date
      t.integer :handover_form_no
      t.string :handover_store_chief_name
      t.string :handover_store_chief_designation
      t.datetime :handover_store_chief_signed_date
      t.string :handover_chief_name
      t.string :handover_chief_designation
      t.datetime :handover_chief_signed_date
      t.string :receiver_store_chief_name
      t.string :receiver_store_chief_designation
      t.datetime :receiver_store_chief_signed_date
      t.string :receiver_chief_name
      t.string :receiver_chief_desination
      t.datetime :receiver_chief_signed_date
      t.integer :office_id
      t.integer :user_id
      t.integer :fiscal_year_id

      t.timestamps
    end
  end
end
