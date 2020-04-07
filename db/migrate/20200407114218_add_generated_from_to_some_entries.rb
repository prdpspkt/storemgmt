class AddGeneratedFromToSomeEntries < ActiveRecord::Migration[5.2]
  def change
    add_column :office_purchase_entries, :generated_from, :string
    add_column :project_purchase_entries, :generated_from, :string
  end
end
