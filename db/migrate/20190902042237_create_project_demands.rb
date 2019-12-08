class CreateProjectDemands < ActiveRecord::Migration[5.2]
  def change
    create_table :project_demands do |t|
      t.string :fy
      t.integer :demand_no
      t.datetime :demand_date
      t.string :demand_by
      t.string :recommended_by
      t.string :project_name
      t.integer :project_id
      t.integer :project_no
      t.datetime :recommended_date
      t.boolean :needed_to_purchase
      t.string :ordered_by
      t.datetime :ordered_date
      t.string :recorded_by
      t.string :recorded_date
      t.integer :user_id
      t.integer :fiscal_year
      t.integer :office_id
      t.integer :item_id
      t.boolean :marked_as_final

      t.timestamps
    end
  end
end
