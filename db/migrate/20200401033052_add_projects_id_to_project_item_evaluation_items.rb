class AddProjectsIdToProjectItemEvaluationItems < ActiveRecord::Migration[5.2]
  def change
    add_column :project_item_evaluation_items, :store_body_id, :integer
  end
end
