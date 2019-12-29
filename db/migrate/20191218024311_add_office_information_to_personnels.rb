class AddOfficeInformationToPersonnels < ActiveRecord::Migration[5.2]
  def change
    add_column :'personnels', :office_id, :integer
    add_column :'personnels', :user_id, :integer
    add_column :'personnels', :fiscal_year_id, :integer
  end
end
