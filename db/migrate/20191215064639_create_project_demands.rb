class CreateProjectDemands < ActiveRecord::Migration[5.2]
  def change
    create_table :project_demands do |t|
      t.integer :demand_no
      t.datetime :demand_date
      t.string :demand_by
      t.string :recommended_by
      t.boolean :needed_to_purchase
      t.string :ordered_by
      t.datetime :ordered_date
      t.string :recorded_by
      t.datetime :recorded_date
      t.integer :user_id
      t.integer :fiscal_year_id
      t.integer :office_id
      t.integer :project_id
      t.integer :item_id
      t.boolean :marked_as_final

      t.timestamps
    end
  end
end
