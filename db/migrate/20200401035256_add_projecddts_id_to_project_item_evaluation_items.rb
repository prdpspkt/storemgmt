class AddProjecddtsIdToProjectItemEvaluationItems < ActiveRecord::Migration[5.2]
  def change
    add_column :project_item_evaluation_items, :rate, :decimal
  end
end
