class AddClassificationToOfficeDemands < ActiveRecord::Migration[5.2]
  def change
    add_column :office_demands, :classification_no, :integer
  end
end
