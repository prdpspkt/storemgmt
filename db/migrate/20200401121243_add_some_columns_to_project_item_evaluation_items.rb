class AddSomeColumnsToProjectItemEvaluationItems < ActiveRecord::Migration[5.2]
  def change
    add_column :project_item_evaluation_items, :name_of_item_ne, :string
    add_column :project_item_evaluation_items, :item_register_page_no, :integer
    add_column :project_item_evaluation_items, :item_classificaiton_no, :integer
    add_column :project_item_evaluation_items, :unit_ne, :string
  end
end
