class AddRecevedByToOfficeReleases < ActiveRecord::Migration[5.2]
  def change
    add_column :office_releases, :received_by, :string
    add_column :office_releases, :received_date, :datetime
  end
end
