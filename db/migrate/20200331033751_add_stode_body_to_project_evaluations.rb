class AddStodeBodyToProjectEvaluations < ActiveRecord::Migration[5.2]
  def change
    add_column :project_evaluations, :store_body_id, :integer
  end
end
