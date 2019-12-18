class AddOfficeInformationToPersonnels < ActiveRecord::Migration[5.2]
  def change
    add_column :'personnels.html.erb', :office_id, :integer
    add_column :'personnels.html.erb', :user_id, :integer
    add_column :'personnels.html.erb', :fiscal_year_id, :integer
  end
end
