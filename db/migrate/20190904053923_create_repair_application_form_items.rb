class CreateRepairApplicationFormItems < ActiveRecord::Migration[5.2]
  def change
    create_table :repair_application_form_items do |t|
      t.string :name_of_item_ne
      t.string :name_of_item_en
      t.string :item_identification_no
      t.decimal :approx_repair_cost
      t.string :reason_to_repair
      t.string :applicant_sign
      t.string :remarks
      t.integer :user_id
      t.integer :office_id
      t.integer :repair_application_form_id

      t.timestamps
    end
  end
end
