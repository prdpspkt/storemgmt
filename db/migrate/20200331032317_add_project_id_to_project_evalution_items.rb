class AddProjectIdToProjectEvalutionItems < ActiveRecord::Migration[5.2]
  def change
    add_column :project_evaluation_items, :project_id, :integer
  end
end
