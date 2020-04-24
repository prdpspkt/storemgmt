class AddSapatiToOfficeOffices < ActiveRecord::Migration[5.2]
  def change
    add_column :office_offices, :sapati, :boolean
  end
end
