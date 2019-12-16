class CreateProjectEvaluationItems < ActiveRecord::Migration[5.2]
  def change
    create_table :project_evaluation_items do |t|
      t.integer :item_classification_no
      t.integer :item_register_page_no
      t.string :name_of_item_ne
      t.string :name_of_item_en
      t.string :unit_ne
      t.string :unit_en
      t.decimal :quantity
      t.decimal :amount
      t.decimal :mached
      t.decimal :unmatched
      t.decimal :decreased_quantity
      t.decimal :increased_quantity
      t.decimal :dein_quantity
      t.decimal :working
      t.decimal :not_working
      t.decimal :to_be_repaired
      t.decimal :to_be_auctioned
      t.decimal :to_be_dispose
      t.decimal :to_be_conserved
      t.decimal :total_amount
      t.string :remarks
      t.integer :item_id
      t.integer :project_item_id
      t.integer :office_id
      t.integer :user_id
      t.integer :fiscal_year_id
      t.string :fy
      t.boolean :marked_as_final

      t.timestamps
    end
  end
end
