class AlterEvaluationIdInProjectItemEvaluationsItems < ActiveRecord::Migration[5.2]
  def change
    rename_column :project_evaluation_items, :evaluation_id, :item_evaluation_id
  end
end
