class AddRateToProjectEvaluationItems < ActiveRecord::Migration[5.2]
  def change
    add_column :project_evaluation_items, :rate, :decimal
  end
end
