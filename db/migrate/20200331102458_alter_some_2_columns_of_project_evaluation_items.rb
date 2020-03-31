class AlterSome2ColumnsOfProjectEvaluationItems < ActiveRecord::Migration[5.2]
  def change
    rename_column :project_evaluation_items, :total_amount, :total_quantity
  end
end
