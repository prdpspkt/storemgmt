class AddNameAndUnitToProjectItemEvaluations < ActiveRecord::Migration[5.2]
  def change
    add_column :project_item_evaluation_items, :name_of_item_en, :string
    add_column :project_item_evaluation_items, :unit_en, :string
  end
end
