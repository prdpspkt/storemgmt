class RenameSomeColmnToProjectEvaluationItems < ActiveRecord::Migration[5.2]
  def change
    rename_column :project_item_evaluation_items, :item_classificaiton_no, :item_classification_no
  end
end
