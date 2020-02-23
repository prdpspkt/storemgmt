class CreateOfficeHandoverForms < ActiveRecord::Migration[5.2]
  def change
    create_table :office_handover_forms do |t|
      t.datetime :decision_date
      t.string :fy
      t.integer :decision_no
      t.string :handovered_office_name
      t.datetime :date
      t.integer :form_no
      t.string :store_chief_name
      t.string :store_chief_designation
      t.datetime :store_chief_signed_date
      t.string :office_chief_name
      t.string :office_chief_designation
      t.datetime :office_chief_signed_date
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
