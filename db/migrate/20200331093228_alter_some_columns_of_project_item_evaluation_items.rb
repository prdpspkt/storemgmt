class AlterSomeColumnsOfProjectItemEvaluationItems < ActiveRecord::Migration[5.2]
  def change
    rename_column :project_evaluation_items, :decreased_quantity, :dquantity
    rename_column :project_evaluation_items, :increased_quantity, :iquantity
    rename_column :project_evaluation_items, :dein_quantity, :diquantity
    rename_column :project_evaluation_items, :to_be_dispose, :to_be_disposed
    rename_column :project_evaluation_items, :mached, :matched
  end
end
