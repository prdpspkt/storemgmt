class AddEmailToOfficePersonnels < ActiveRecord::Migration[5.2]
  def change
    add_column :office_personnels, :email, :string
    add_column :office_personnels, :remarks, :string
  end
end
