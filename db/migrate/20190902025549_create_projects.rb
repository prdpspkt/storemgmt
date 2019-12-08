class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :name_ne
      t.string :name_en
      t.string :address
      t.string :committee_name
      t.string :president
      t.string :phone
      t.integer :user_id
      t.integer :office_id
      t.integer :fiscal_year_id
      t.string :started_fy

      t.timestamps
    end
  end
end
