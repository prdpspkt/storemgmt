class CreateProjectReleases < ActiveRecord::Migration[5.2]
  def change
    create_table :project_releases do |t|
      t.string :fy
      t.integer :release_no
      t.datetime :release_date
      t.string :store_chief_name
      t.datetime :store_chief_signed_date
      t.string :office_cheif_name
      t.datetime :office_cheif_signed_date
      t.integer :user_id
      t.integer :office_id
      t.integer :fiscal_year_id
      t.string :project_name
      t.integer :project_id

      t.timestamps
    end
  end
end
