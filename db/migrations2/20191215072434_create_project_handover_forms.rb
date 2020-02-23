class CreateProjectHandoverForms < ActiveRecord::Migration[5.2]
  def change
    create_table :project_handover_forms do |t|
      t.integer :decision_no
      t.datetime :decision_date
      t.string :fy
      t.string :handovered_project_name
      t.datetime :date
      t.integer :form_no
      t.string :store_chief_name
      t.string :store_chief_designation
      t.datetime :store_chief_sign_date
      t.string :office_chief_name
      t.string :office_chief_designation
      t.datetime :office_chief_signed_date
      t.integer :office_id
      t.integer :user_id
      t.integer :fiscal_year_id
      t.boolean :marked_as_final

      t.timestamps
    end
  end
end
