class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :name_of_project_ne
      t.string :name_of_project_en
      t.string :name_of_consumer_committee
      t.string :address
      t.string :phone_of_committee_representative
      t.string :name_of_committee_representative
      t.string :post_of_representative
      t.string :contractor
      t.string :phone_of_contrator_representative
      t.string :name_of_contractor_representative
      t.integer :user_id
      t.integer :office_id
      t.integer :fiscal_year_id
      t.integer :project_status

      t.timestamps
    end
  end
end
