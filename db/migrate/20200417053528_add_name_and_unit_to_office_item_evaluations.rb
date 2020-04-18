class AddNameAndUnitToOfficeItemEvaluations < ActiveRecord::Migration[5.2]
  def change
    add_column :office_item_evaluation_items, :name_of_item_en, :string
    add_column :office_item_evaluation_items, :unit_en, :string
  end
end